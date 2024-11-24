Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30287E668B3
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 14:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369710E067;
	Sun, 24 Nov 2024 14:23:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF58110E067;
 Sun, 24 Nov 2024 14:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fpm=5Fr?=
 =?utf-8?q?pm=3A_Fix_cursor=5Ffb3_framebuffer_creation_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 14:23:16 -0000
Message-ID: <173245819671.2468359.8324362733421935574@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122040958.145956-1-jeevan.b@intel.com>
In-Reply-To: <20241122040958.145956-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer creation format
URL   : https://patchwork.freedesktop.org/series/141684/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15727_full -> IGTPW_12169_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12169_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12169_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12169_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_cs_tlb@engines@rcs0:
    - shard-rkl:          [PASS][1] -> [DMESG-WARN][2] +59 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_cs_tlb@engines@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@gem_cs_tlb@engines@rcs0.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-6/igt@gem_eio@kms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-2/igt@gem_eio@kms.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb6/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][8] -> [SKIP][9] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@i915_module_load@resize-bar.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@i915_module_load@resize-bar.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][10] +6 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [ABORT][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][13] -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@perf_pmu@most-busy-check-all.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          [SKIP][15] ([i915#11078]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][17] ([i915#2575]) -> [SKIP][18] +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][19] +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15727_full and IGTPW_12169_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.53] s

  

Known issues
------------

  Here are the changes found in IGTPW_12169_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-dg2:          [PASS][20] -> [SKIP][21] +28 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@api_intel_allocator@two-level-inception-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8411])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#6230])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#11078])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8414]) +13 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8414])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@info:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#1849] / [i915#2582])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@fbdev@info.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#3555] / [i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][33] ([i915#12392] / [i915#7297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#6335]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [PASS][36] -> [SKIP][37] ([i915#2575]) +199 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@gem_ctx_exec@basic-nohangcheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#8555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8555]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#1099]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4771]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#6334]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][46] ([i915#11965] / [i915#12558]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][47] ([i915#11965]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3281]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4537] / [i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4812]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][55] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [PASS][58] -> [SKIP][59] ([i915#12936]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@gem_lmem_swapping@parallel-multi.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#4613]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-glk2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#12193]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4565]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4077]) +21 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@gem_mmap_gtt@coherency.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#4270])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@gem_pxp@create-regular-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12917])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#2575] / [i915#5190]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_tiling_max_stride:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4077]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297] / [i915#3323])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297] / [i915#4880])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_wait@write-busy:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2575]) +62 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_wait@write-busy.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][90] -> [ABORT][91] ([i915#9820])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#8399]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][93] -> [INCOMPLETE][94] ([i915#12455]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#6590]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#6590]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][97] -> [FAIL][98] ([i915#12942]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][99] ([i915#2681]) +1 other test warn
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#11681] / [i915#6621])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#11681] / [i915#6621])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#11681])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4387])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#4387])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5723])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#5723])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][107] ([i915#9311]) +1 other test dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [PASS][108] -> [INCOMPLETE][109] ([i915#4817])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@i915_suspend@forcewake.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-5/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4212])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          [PASS][111] -> [SKIP][112] ([i915#2575] / [i915#5190])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4212]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#8709]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#6228])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][116] -> [FAIL][117] ([i915#5956]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][118] ([i915#1769])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5286]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5286]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#5286])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538] / [i915#5286]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5286]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3638]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5190]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3638])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#6095]) +146 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6095]) +69 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#10434] / [i915#6095])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#10307] / [i915#6095]) +110 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#12313])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#12313]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#6095]) +82 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#12805])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#12805])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#6095]) +19 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][139] -> [DMESG-WARN][140] ([i915#4423]) +2 other tests dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#12313]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#6095]) +39 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#12313])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3742])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3742])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#3742])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4087]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#7828]) +11 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#7828]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#7828]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#7828]) +10 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#7828]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#7116] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#9424]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3299]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][158] ([i915#7173])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#9424]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#7118] / [i915#9424]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12976])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#3555]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3555]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#12976]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3555]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#12976])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-rkl:          [PASS][167] -> [DMESG-WARN][168] ([i915#12917])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#4103])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#5354]) +16 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#9833])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#9723])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8588])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#8588])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#8588])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8588])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#1257])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3840]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3840])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3840])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3555] / [i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3840] / [i915#9053])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3469])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#1839]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#1839])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][189] -> [FAIL][190] ([i915#2122]) +7 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#9934]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#8381]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#3637]) +9 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#9934]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#3637]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2:          [PASS][196] -> [FAIL][197] ([i915#2122]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-8/igt@kms_flip@blocking-wf_vblank.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg1:          [PASS][198] -> [FAIL][199] ([i915#11989] / [i915#12517] / [i915#2122])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
    - shard-dg1:          [PASS][200] -> [FAIL][201] ([i915#11989])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][202] -> [FAIL][203] ([i915#2122]) +3 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
    - shard-dg2:          NOTRUN -> [FAIL][204] ([i915#2122]) +5 other tests fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#2587] / [i915#2672]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#2587] / [i915#2672]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672] / [i915#3555])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#2672]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#2672] / [i915#3555] / [i915#5190])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#2672] / [i915#3555]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2587] / [i915#2672]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#2672] / [i915#3555]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#2672]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5274])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8708]) +9 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] +54 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#8708]) +30 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#5439])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][221] +59 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#1825]) +17 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][223] +102 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3458]) +18 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#5439])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#5439])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#5439])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#10055]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9766])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9766])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3023]) +10 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#3458]) +12 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8228])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#12388])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#12388])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#12339])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#10656])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#10656])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#12388])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#12388])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#12394])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#12394])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#12339])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#12339])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#12339])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#6301])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [PASS][251] -> [DMESG-WARN][252] ([i915#12964]) +7 other tests dmesg-warn
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#3555]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8806])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#12247]) +13 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2575] / [i915#9423]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#12247]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#12247]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#12247] / [i915#6953])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#12247]) +22 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#2575] / [i915#9423]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#12247] / [i915#6953])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#12247] / [i915#6953])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#12247]) +8 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9685])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#9685])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#9685])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][269] +35 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#8430])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#8430])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#8430])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][273] -> [SKIP][274] ([i915#9519]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#9519]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12937])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#12937]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#9519]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#6524])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#6524]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][282] ([i915#11520]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][283] ([i915#11520]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-glk8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#11520]) +8 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#11520]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#11520]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#11520]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#11520]) +13 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9683])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#1072] / [i915#9732]) +31 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +11 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#9732]) +25 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#9732]) +12 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +14 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][295] +145 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#9685]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#5289]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#5289])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#5289]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#5289]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#3555]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][302] ([i915#12231]) +1 other test abort
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-4/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#8623])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#8623])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#9906])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#11920])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#9906]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#2437])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][309] ([i915#2437])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-glk5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#2437])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@oa-exponents:
    - shard-dg2:          [PASS][311] -> [SKIP][312] ([i915#12506]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@perf@oa-exponents.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@perf@oa-exponents.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#2433])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][314] ([i915#4349]) +4 other tests fail
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#8850])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-12/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12506]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][317] -> [FAIL][318] ([i915#4349])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@perf_pmu@most-busy-check-all@rcs0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@perf_pmu@most-busy-check-all@rcs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][319] ([i915#9351])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][320] ([i915#9351])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#3708])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#3708] / [i915#4077])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#3291] / [i915#3708])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][324] ([i915#12910]) +9 other tests fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][325] ([i915#12910]) +8 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][326] +156 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb7/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][327] +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#4818])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#4818])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][330] -> [FAIL][331] ([i915#12875])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@tools_test@tools_test.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][332] ([i915#11703]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@core_hotunplug@unbind-rebind.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb6/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][334] ([i915#2582]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@fbdev@unaligned-read.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@fbdev@unaligned-read.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][336] ([i915#9561]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [FAIL][338] ([i915#11980] / [i915#12580]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_ctx_persistence@hostile.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-rkl:          [DMESG-WARN][340] ([i915#12964]) -> [PASS][341] +8 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-dg2:          [SKIP][342] ([i915#12936]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_lmem_swapping@heavy-random.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu:         [SKIP][344] ([i915#4270]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][346] -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][348] ([i915#2575]) -> [PASS][349] +128 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@gem_vm_create@execbuf.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][350] ([i915#9820]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][352] -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html
    - shard-rkl:          [INCOMPLETE][354] ([i915#4817]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][356] -> [PASS][357] +18 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][358] ([i915#2346]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][360] ([i915#12917]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [FAIL][362] ([i915#2122]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [INCOMPLETE][364] ([i915#4423] / [i915#4839] / [i915#6113]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4:
    - shard-dg1:          [DMESG-WARN][366] ([i915#4423]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:
    - shard-dg1:          [INCOMPLETE][368] ([i915#4423] / [i915#6113]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][370] ([i915#2122]) -> [PASS][371] +4 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [FAIL][372] ([i915#2122]) -> [PASS][373] +5 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [SKIP][374] -> [PASS][375] +12 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          [SKIP][376] -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-13/igt@kms_hdmi_inject@inject-audio.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [ABORT][378] -> [PASS][379] +3 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@kms_plane@pixel-format-source-clamping.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-7/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [SKIP][380] ([i915#2575] / [i915#9423]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][382] ([i915#9295]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][384] ([i915#4281]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [SKIP][386] ([i915#12937]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_pm_rpm@cursor.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][388] ([i915#9519]) -> [PASS][389] +2 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][390] ([i915#9519]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][392] -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][394] ([i915#12506]) -> [PASS][395] +4 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [FAIL][396] ([i915#10538]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@perf@polling@0-rcs0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-3/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-accuracy-50@vecs0:
    - shard-rkl:          [DMESG-WARN][398] -> [PASS][399] +39 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@perf_pmu@busy-accuracy-50@vecs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-4/igt@perf_pmu@busy-accuracy-50@vecs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][400] ([i915#4349]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-dg1:          [FAIL][402] ([i915#11943]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][404] ([i915#8411]) -> [SKIP][405] ([i915#2575])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@api_intel_bb@object-reloc-keep-cache.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][406] ([i915#8414]) -> [SKIP][407] ([i915#12506]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@drm_fdinfo@virtual-busy-idle-all.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][408] ([i915#3936]) -> [SKIP][409] ([i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_busy@semaphore.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_busy@semaphore.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [INCOMPLETE][411] ([i915#7297])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#8555])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][414] ([i915#8555]) -> [SKIP][415] ([i915#2575])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#280])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][418] ([i915#4771]) -> [SKIP][419] ([i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          [SKIP][420] ([i915#4812]) -> [SKIP][421] ([i915#2575]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_balancer@sliced.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [FAIL][423] ([i915#11965] / [i915#12558])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_capture@capture.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@gem_exec_capture@capture.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#3539] / [i915#4852])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#3539])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          [SKIP][428] ([i915#3539] / [i915#4852]) -> [SKIP][429] ([i915#2575]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#3281]) +5 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-dg2:          [SKIP][432] ([i915#3281]) -> [SKIP][433] ([i915#2575]) +10 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_reloc@basic-wc-active.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][434] ([i915#4860]) -> [SKIP][435] ([i915#2575])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4860])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-none.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_mmap_gtt@basic-write-gtt:
    - shard-dg2:          [SKIP][438] ([i915#4077]) -> [SKIP][439] ([i915#2575]) +6 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@gem_mmap_gtt@basic-write-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_mmap_gtt@basic-write-gtt.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#4077]) +7 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#4083]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_wc@fault-concurrent.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-10/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#3282]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          [SKIP][446] ([i915#3282]) -> [SKIP][447] ([i915#2575]) +8 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_pread@snoop.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-dg2-11/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][448] ([i915#4270]) -> [TIMEOUT][449] ([i915#12964])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          [SKIP][450] ([i915#4270]) -> [SKIP][451] ([i915#2575]) +4 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_pxp@dmabuf-shared-protected-dst

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12169/index.html
