Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750CFE668B5
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 14:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E610E05C;
	Sun, 24 Nov 2024 14:40:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3810E05C;
 Sun, 24 Nov 2024 14:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fbig=5F?=
 =?utf-8?q?fb=3A_Intel_display_version_20_onwards_doesn=27t_do_hflip_with_ti?=
 =?utf-8?q?le4_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 14:40:14 -0000
Message-ID: <173245921484.2483786.11739441550802223892@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122053400.1931176-1-pranay.samala@intel.com>
In-Reply-To: <20241122053400.1931176-1-pranay.samala@intel.com>
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

Series: tests/intel/kms_big_fb: Intel display version 20 onwards doesn't do hflip with tile4 (rev2)
URL   : https://patchwork.freedesktop.org/series/141478/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15727_full -> IGTPW_12170_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12170_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12170_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12170_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-tglu:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@core_getversion@all-cards.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][3] -> [DMESG-FAIL][4] +3 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [PASS][9] -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@i915_pm_rpm@sysfs-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          [PASS][11] -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@i915_pm_rpm@system-suspend-devices.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@engine-order:
    - shard-dg2:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@i915_pm_rps@engine-order.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu-1:       NOTRUN -> [ABORT][15] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][16] +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [PASS][17] -> [DMESG-WARN][18] +40 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][19] +9 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          [SKIP][20] ([i915#11078]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@i915_selftest@live:
    - shard-rkl:          [ABORT][22] -> [DMESG-FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@i915_selftest@live.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@i915_selftest@live.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][24] ([i915#2575]) -> [SKIP][25] +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][26] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-9/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_12170_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [PASS][27] -> [SKIP][28] +27 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@api_intel_allocator@default-alignment.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8411]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#9318])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#11078])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#8414]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8414]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@drm_fdinfo@busy@vcs1.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][34] -> [SKIP][35] ([i915#2582]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@fbdev@eof.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@fbdev@eof.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3555] / [i915#9323])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#9323])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#7697])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#8562])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][42] ([i915#1099]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4771])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4771]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#6334]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3281]) +14 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][55] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          [PASS][58] -> [SKIP][59] ([i915#12936]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-multi.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4613]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#12936]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4077]) +13 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-2/igt@gem_mmap_gtt@pf-nonblock.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@gem_mmap_wc@bad-size.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12917]) +1 other test timeout
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4270]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4079])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#3297] / [i915#3323])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4880])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#4880])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#2856]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#2527])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#2527]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#8399]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#8399])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#6590]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#6590]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#11681] / [i915#6621])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4387])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#4387])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#5723])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#5723])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][103] ([i915#9311]) +1 other test dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4212]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2575] / [i915#5190])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][106] -> [SKIP][107] ([i915#2575] / [i915#5190]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#4212]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#12454] / [i915#12712])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#8709]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#8709]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#8709]) +11 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#6228])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#5286]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#5286]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5286]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#5286])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#5190]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3638]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [ABORT][121] ([i915#10354])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3638]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5190]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] +44 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#12313])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#6095]) +117 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#6095]) +169 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#6095]) +84 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#12313])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#12805])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#12805])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#6095]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#12313]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#6095]) +34 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#12313])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6095]) +75 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3742])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#11616] / [i915#7213])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3742])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#7828]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#7828]) +12 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7828]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#7828]) +8 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#7828]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#3555] / [i915#9979])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7118] / [i915#9424])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6944] / [i915#9424]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#3116] / [i915#3299])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3299])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7116] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-rkl:          [PASS][155] -> [DMESG-WARN][156] ([i915#12917])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#12976]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#12976])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3555]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][160] ([i915#12917])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#3555]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#3555])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4103] / [i915#4213])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#4103]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4103] / [i915#4213])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#4103])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#9833])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#9723])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#9723])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#8588])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#8588])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#8588])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3804])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#1257])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#1257])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3840]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3840])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@kms_dsc@dsc-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3555] / [i915#3840])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3840] / [i915#9053])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#1839]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9934]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3637]) +8 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#3637]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#9934]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-rkl:          [PASS][189] -> [FAIL][190] ([i915#11989] / [i915#12840] / [i915#2122])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_flip@blocking-wf_vblank.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
    - shard-rkl:          [PASS][191] -> [FAIL][192] ([i915#11989]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][193] ([i915#12964]) +1 other test dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [PASS][194] -> [DMESG-WARN][195] ([i915#12964]) +7 other tests dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][196] ([i915#2122]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [PASS][197] -> [FAIL][198] ([i915#12840] / [i915#2122])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
    - shard-rkl:          [PASS][199] -> [FAIL][200] ([i915#11989] / [i915#12840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][201] -> [FAIL][202] ([i915#2122]) +8 other tests fail
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [PASS][203] -> [FAIL][204] ([i915#2122]) +2 other tests fail
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#2672] / [i915#3555]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#2587] / [i915#2672]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#2587] / [i915#2672]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#2587] / [i915#2672]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#2672] / [i915#3555]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2672] / [i915#3555]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2672] / [i915#3555]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#2672]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5274])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8708]) +24 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][217] -> [INCOMPLETE][218] ([i915#10056])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#10055])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#10433] / [i915#3458])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#3458]) +10 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#8708]) +10 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][223] +50 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#5354]) +22 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#1825]) +16 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][226] +107 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#3458]) +24 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#5439])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#5439])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9766])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#9766])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3023]) +10 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#12713])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#10656])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][240] -> [SKIP][241] ([i915#12388])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#12339])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#10656])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#10656])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12388])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#12388])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12388])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#12394])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#12339])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#12339])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#12339])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][252] ([i915#12169])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][253] ([i915#10647]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3555]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8806])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][256] ([i915#8292])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#12247]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2575] / [i915#9423])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          [PASS][259] -> [SKIP][260] ([i915#2575] / [i915#9423]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#12247]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#12247]) +9 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#12247] / [i915#6953])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#12247]) +17 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#12247] / [i915#6953])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#12247]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#5354])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#9812]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#9812])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#9685])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9685])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9685])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][273] +36 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#8430])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#8430])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][276] -> [SKIP][277] ([i915#9519])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#9519])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][279] -> [SKIP][280] ([i915#9519])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#9519]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][282] -> [SKIP][283] ([i915#12937])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#6524]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#6524]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][286] ([i915#11520]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11520]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#11520]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#11520]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#11520]) +7 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#11520]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#11520]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#9683]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +28 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9732]) +23 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-9/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#1072] / [i915#9732]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#1072] / [i915#9732]) +14 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@kms_psr@psr-cursor-mmap-cpu.html
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#9732]) +10 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][299] +345 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9685])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#12755])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#5289]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#5289])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#5289])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3555]) +6 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][306] ([i915#12231]) +1 other test abort
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-snb:          [PASS][307] -> [FAIL][308] ([IGT#2] / [i915#6493])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb6/igt@kms_sysfs_edid_timing.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#8623])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#9906])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#9906])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#9906])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#9906])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#2437])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2437] / [i915#9412])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][316] ([i915#2437]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-glk1/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#2437])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#2437])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#2433])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-13/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy:
    - shard-dg2:          [PASS][320] -> [SKIP][321] ([i915#12506]) +9 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@perf_pmu@busy.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@perf_pmu@busy.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][322] ([i915#4349]) +4 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#8850])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12506]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#8516])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#8516]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_reprime:
    - shard-dg2:          [PASS][327] -> [SKIP][328] ([i915#2575]) +152 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@prime_mmap@test_reprime.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@prime_mmap@test_reprime.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#3708] / [i915#4077])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#3291] / [i915#3708])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#9917]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][332] ([i915#12910]) +9 other tests fail
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][333] ([i915#12910]) +8 other tests fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#2575]) +54 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][335] +154 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb2/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][336] +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#4818])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#2575] / [i915#4818])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][339] ([i915#11703]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@core_hotunplug@unbind-rebind.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb7/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [FAIL][341] -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@core_setmaster@master-drop-set-user.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][343] -> [PASS][344] +46 other tests pass
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][345] ([i915#2582]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@fbdev@unaligned-read.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@fbdev@unaligned-read.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-rkl:          [DMESG-WARN][347] ([i915#12964]) -> [PASS][348] +12 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-dg2:          [SKIP][349] ([i915#12936]) -> [PASS][350] +2 other tests pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_lmem_swapping@parallel-random-engines.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu:         [SKIP][351] ([i915#4270]) -> [PASS][352] +1 other test pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@gem_pxp@create-protected-buffer.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][353] ([i915#9820]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][355] ([i915#12548] / [i915#3591]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [FAIL][357] ([i915#12739] / [i915#3591]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - shard-rkl:          [ABORT][359] -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@i915_selftest@live@guc_multi_lrc.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-4/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [ABORT][361] -> [PASS][362] +1 other test pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-5/igt@i915_selftest@perf.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][363] -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [SKIP][365] -> [PASS][366] +27 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][367] ([i915#2346]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][369] ([i915#12917]) -> [PASS][370] +2 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][371] ([i915#2122]) -> [PASS][372] +5 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][373] ([i915#2122]) -> [PASS][374] +7 other tests pass
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [FAIL][375] ([i915#11989] / [i915#2122]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg1:          [FAIL][377] ([i915#11989] / [i915#12517] / [i915#2122]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          [FAIL][379] ([i915#2122]) -> [PASS][380] +2 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
    - shard-tglu-1:       [FAIL][381] ([i915#2122]) -> [PASS][382] +3 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:
    - shard-dg1:          [FAIL][383] ([i915#11989]) -> [PASS][384] +2 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [SKIP][385] ([i915#2575]) -> [PASS][386] +153 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-8/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][387] -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [SKIP][389] ([i915#2575] / [i915#9423]) -> [PASS][390] +1 other test pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][391] ([i915#9295]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [SKIP][393] ([i915#12937]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_pm_rpm@cursor-dpms.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][395] ([i915#9519]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-snb:          [SKIP][397] -> [PASS][398] +6 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb6/igt@kms_setmode@clone-exclusive-crtc.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-snb7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][399] ([i915#12506]) -> [PASS][400] +7 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-1/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [FAIL][401] ([i915#10538]) -> [PASS][402] +1 other test pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@perf@polling@0-rcs0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-rkl-2/igt@perf@polling@0-rcs0.html

  * igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - shard-dg1:          [DMESG-WARN][403] ([i915#4423]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg1-14/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][405] ([i915#8411]) -> [SKIP][406] ([i915#2575])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-hang:
    - shard-dg2:          [SKIP][407] ([i915#12506]) -> [SKIP][408] ([i915#8414])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@drm_fdinfo@busy-hang.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@drm_fdinfo@busy-hang.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][409] ([i915#8414]) -> [SKIP][410] ([i915#12506]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@drm_fdinfo@virtual-busy-idle-all.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][411] ([i915#9561]) -> [SKIP][412] ([i915#2575])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][413] ([i915#2575]) -> [SKIP][414] ([i915#8555])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][415] ([i915#8555]) -> [SKIP][416] ([i915#2575]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          [SKIP][417] ([i915#5882]) -> [SKIP][418] ([i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][419] ([i915#2575]) -> [SKIP][420] ([i915#280])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][421] ([i915#280]) -> [SKIP][422] ([i915#2575]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][423] ([i915#4812]) -> [SKIP][424] ([i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][425] ([i915#3539] / [i915#4852]) -> [SKIP][426] ([i915#2575]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_flush@basic-uc-ro-default.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [SKIP][428] ([i915#3539] / [i915#4852])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-7/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [SKIP][430] ([i915#3281]) +7 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          [SKIP][431] ([i915#3281]) -> [SKIP][432] ([i915#2575]) +8 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-noreloc.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          [SKIP][433] ([i915#4537] / [i915#4812]) -> [SKIP][434] ([i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@gem_exec_schedule@preempt-queue.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][435] ([i915#4860]) -> [SKIP][436] ([i915#2575]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          [SKIP][437] ([i915#2575]) -> [SKIP][438] ([i915#4860]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_mmap_gtt@basic-write-gtt:
    - shard-dg2:          [SKIP][439] ([i915#4077]) -> [SKIP][440] ([i915#2575]) +6 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@gem_mmap_gtt@basic-write-gtt.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_mmap_gtt@basic-write-gtt.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][441] ([i915#2575]) -> [SKIP][442] ([i915#4077]) +8 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          [SKIP][443] ([i915#4083]) -> [SKIP][444] ([i915#2575]) +5 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_mmap_wc@close.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [SKIP][446] ([i915#4083]) +3 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          [SKIP][447] ([i915#3282]) -> [SKIP][448] ([i915#2575]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          [SKIP][449] ([i915#2575]) -> [SKIP][450] ([i915#3282])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/shard-dg2-10/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][451] ([i915#4270]) -> [TIMEOUT][452] ([i915#12964])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
   [452

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12170/index.html
