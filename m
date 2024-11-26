Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC52ED3B9BD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 21:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEA110E176;
	Tue, 26 Nov 2024 21:50:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5779C10E176;
 Tue, 26 Nov 2024 21:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Ignore_more_warns_in_xe?=
 =?utf-8?q?=5Fwedged_tests_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 21:50:41 -0000
Message-ID: <173265784134.3459849.6517184240224613411@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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

Series: Ignore more warns in xe_wedged tests (rev5)
URL   : https://patchwork.freedesktop.org/series/140511/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15749_full -> IGTPW_12202_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12202_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12202_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12202_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-1/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_selftest@live:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-7/igt@i915_selftest@live.html
    - shard-dg1:          NOTRUN -> [ABORT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@i915_selftest@live.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - shard-mtlp:         [PASS][8] -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-mtlp:         [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-rkl:          [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-4/igt@kms_pm_rpm@fences-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_pm_rpm@fences-dpms.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-dg2:          NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@perf_pmu@busy-accuracy-98.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FAIL][15] ([i915#11627]) -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][17] ([i915#9519]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          [FAIL][19] ([i915#4349]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-3/igt@perf_pmu@busy-double-start.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdr@brightness-with-hdr:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html

  
Known issues
------------

  Here are the changes found in IGTPW_12202_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8411]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][24] +133 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb7/igt@api_intel_bb@object-noreloc-keep-cache-simple.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8414]) +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][26] -> [SKIP][27] ([i915#1849] / [i915#2582])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-7/igt@fbdev@info.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@write:
    - shard-dg2:          [PASS][28] -> [SKIP][29] ([i915#2582])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@fbdev@write.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@fbdev@write.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][31] ([i915#12392])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#7697])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-5/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#7697])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#6335])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8562])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#8562])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8562])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#8562])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#1099]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#8555]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#8555])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#5882]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#280])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#280])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4771]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#8555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#6334]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#6334]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3281]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3281]) +12 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3281]) +10 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4537] / [i915#4812]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4812]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          [PASS][62] -> [DMESG-WARN][63] ([i915#4423]) +1 other test dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-18/igt@gem_exec_suspend@basic-s3-devices.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4860]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4860])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4860])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#2190])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#12936])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#4613])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][73] ([i915#5493]) +1 other test timeout
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][74] ([i915#5493]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [PASS][75] -> [SKIP][76] ([i915#12936]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@gem_lmem_swapping@verify-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#12193]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][78] ([i915#4613]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-glk4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4565]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#284])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#284])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#284])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077]) +18 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4083]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_mmap_wc@read.html
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4083])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4083]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@gem_mmap_wc@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3282]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3282]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][90] ([i915#2658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4270]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12964])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4270]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         [PASS][94] -> [SKIP][95] ([i915#4270])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3282]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2575] / [i915#5190]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#8428]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4079]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4885])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4077]) +12 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4077]) +10 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297] / [i915#4880])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3281] / [i915#3297])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297] / [i915#4958])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2575]) +88 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [PASS][114] -> [SKIP][115] ([i915#2575]) +150 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-4/igt@gem_vm_create@execbuf.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@gem_vm_create@execbuf.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#2527] / [i915#2856])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-8/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#2527]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#2856]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#2527])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@gen9_exec_parse@unaligned-access.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#2856])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][122] ([i915#13029])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][123] ([i915#12817] / [i915#9820])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#8399])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][125] ([i915#2681]) +1 other test warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#13014])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#13014])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][129] ([i915#8346])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-5/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#11681])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#6245])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-7/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#6245])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-dg1:          NOTRUN -> [ABORT][133] ([i915#9413])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         NOTRUN -> [ABORT][134] ([i915#13010]) +1 other test abort
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][135] ([i915#9311]) +1 other test dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][136] ([i915#7443])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#7707])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          [PASS][138] -> [SKIP][139] ([i915#2575] / [i915#5190])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#4212])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4212]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8709]) +11 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#8709]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#8709]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#8709]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#8709]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#1769] / [i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][148] ([i915#12964]) +13 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         [PASS][149] -> [FAIL][150] ([i915#11808] / [i915#5956]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#5286]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#5286])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#5286]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#5286]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3638]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][157] -> [SKIP][158] +19 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3638]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5190]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5190]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6187]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4538]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][164] +15 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#12313])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#12313])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6095]) +54 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#6095]) +88 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#6095]) +34 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#10307] / [i915#6095]) +146 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#6095]) +11 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#12313])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#6095]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#12313])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#12313]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#6095]) +149 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#7213] / [i915#9010]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3742])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3742])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3742]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#4087]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#7828]) +9 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-5/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7828]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#7828]) +16 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#7828]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#7828]) +5 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#7828]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][190] ([i915#7173])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#6944] / [i915#9424])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9424])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#6944] / [i915#9424])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3555]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#13049])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13049])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#13049])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#13049]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#13049]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#13049]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8814]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8814]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][204] +13 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#9809]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [PASS][206] -> [FAIL][207] ([i915#2346])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#4103] / [i915#4213])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#9833])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][210] ([i915#12170])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][211] ([i915#11968])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#9723])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#9723])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#9833])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#12402])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#12402])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#8812])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8812])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#8812])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#3840])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#3555] / [i915#3840])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3555] / [i915#3840])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#1839])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1839])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#9337])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9337])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9337])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#658])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3637]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#9934]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3637]) +8 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#8381]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9934]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#3637]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9934]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#8381]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][239] -> [INCOMPLETE][240] ([i915#4839] / [i915#6113])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-dg1:          [PASS][241] -> [INCOMPLETE][242] ([i915#6113])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-13/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][243] -> [FAIL][244] ([i915#11989]) +5 other tests fail
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [PASS][245] -> [FAIL][246] ([i915#11989]) +3 other tests fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][247] ([i915#11989])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][248] ([i915#11832] / [i915#11989])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#2672] / [i915#8813]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#2672]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8810] / [i915#8813])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672]) +5 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2672]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#2587] / [i915#2672])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8813])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#8810]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#2672] / [i915#3555]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [PASS][264] -> [DMESG-WARN][265] ([i915#12964]) +62 other tests dmesg-warn
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#8708]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][267] -> [FAIL][268] ([i915#6880])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#1825]) +25 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] +22 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-snb:          [PASS][271] -> [SKIP][272] +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#1825]) +28 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#8708]) +22 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][275] -> [DMESG-FAIL][276] ([i915#12964]) +3 other tests dmesg-fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#5439])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#5439])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#10433] / [i915#3458])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][280] +46 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#5354]) +38 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#8708]) +18 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][283] +46 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#3023]) +14 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#3458]) +18 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][286] +82 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3458]) +11 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#6118])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#3555] / [i915#8228])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3555] / [i915#8228])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8228]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8228]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#3555] / [i915#8228])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12394])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#10656])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#12339])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#12339])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#12339])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#12339])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#1839])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#6301]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#6301])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-7/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#6301])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8821])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][306] ([i915#8292])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#12247]) +4 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#12247]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [PASS][309] -> [SKIP][310] ([i915#2575] / [i915#9423]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][311] +270 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-glk5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#12247]) +9 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#12247] / [i915#6953]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#12247]) +16 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#2575] / [i915#9423])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#12247]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#12247] / [i915#6953] / [i915#9423])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#12247]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][319] ([i915#12912])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#9340])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [PASS][321] -> [SKIP][322] ([i915#12916])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [PASS][324] -> [SKIP][325] ([i915#9519]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][326] -> [SKIP][327] ([i915#12937])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12937])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][329] -> [SKIP][330] ([i915#9519])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#9519])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#6524])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-5/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#6524])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-8/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#6524])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([Intel XE#3529])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#11520]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#9808])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#11520]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#11520]) +10 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#11520]) +7 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-glk1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#12316]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][342] ([i915#11520]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#11520]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#11520]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#9683])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#4348]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9683]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9683]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9683]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#9688]) +16 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#1072] / [i915#9732]) +26 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +13 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-4/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#9732]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#1072] / [i915#9732]) +19 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#9732]) +18 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#9685]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#9685]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#9685]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] ([i915#9685]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#9685])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#5289])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#12755])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#12755])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#3555]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#3555]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#3555] / [i915#5030] / [i915#9041])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#5030]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#5030] / [i915#9041])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][369] ([i915#12231]) +1 other test abort
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-glk8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][370] -> [FAIL][371] ([i915#5465]) +2 other tests fail
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-2/igt@kms_setmode@basic.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#8623])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         [PASS][373] -> [FAIL][374] ([i915#9196]) +1 other test fail
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#9906]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-12/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#9906])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-5/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#2437])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][378] ([i915#2437])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-glk8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#2437])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#2437] / [i915#9412])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#2437] / [i915#9412])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#2436])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#7387])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@perf@global-sseu-config-invalid.html
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#7387])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#2435])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#2433]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#8850])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#12506]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][389] ([i915#12549] / [i915#6806]) +1 other test fail
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@invalid-init:
    - shard-dg2:          [PASS][390] -> [SKIP][391] ([i915#12506]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-5/igt@perf_pmu@invalid-init.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-11/igt@perf_pmu@invalid-init.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#8516])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-14/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][393] ([i915#4349]) +4 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][394] ([i915#9351])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][395] ([i915#9351])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][396] ([i915#3708] / [i915#4077])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#3708])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#3291] / [i915#3708])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-rkl-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#3291] / [i915#3708]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#3708]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#10216] / [i915#3708])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#3708] / [i915#4077])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#9917])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][404] ([i915#12866]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@core_getversion@basic.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@core_getversion@basic.html

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         [ABORT][406] -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-7/igt@debugfs_test@read_all_entries_display_off.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_off.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][408] ([i915#2582]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@fbdev@eof.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-2/igt@fbdev@eof.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [PASS][411] +151 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-10/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][412] ([i915#12714] / [i915#5784]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][414] ([i915#11713]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-8/igt@gem_exec_big@single.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][416] ([i915#11441]) -> [PASS][417] +1 other test pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          [SKIP][418] ([i915#12936]) -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [ABORT][420] ([i915#13010]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-9/igt@i915_module_load@reload.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-tglu-2/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][422] ([i915#9820]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          [SKIP][424] ([i915#13014]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][426] ([i915#7984]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-8/igt@i915_power@sanity.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-mtlp-7/igt@i915_power@sanity.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-dg2:          [FAIL][428] ([i915#12867]) -> [PASS][429] +2 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@i915_selftest@perf@engine_cs.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-7/igt@i915_selftest@perf@engine_cs.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [WARN][430] -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg2-5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [FAIL][432] ([i915#2346]) -> [PASS][433] +1 other test pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][434] ([i915#11989]) -> [PASS][435] +9 other tests pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [DMESG-WARN][436] ([i915#4423]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-snb:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12202/index.html
