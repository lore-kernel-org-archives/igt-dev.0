Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D45D66BA5
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 01:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEE210E0BC;
	Wed, 27 Nov 2024 01:13:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262B710E0BC;
 Wed, 27 Nov 2024 01:13:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fwedged?=
 =?utf-8?q?=3A_Manage_verbosity_of_GT_reset_fault_injection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 01:13:14 -0000
Message-ID: <173266999414.3549578.7794920787047413121@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126230240.1780940-1-matthew.d.roper@intel.com>
In-Reply-To: <20241126230240.1780940-1-matthew.d.roper@intel.com>
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

Series: tests/intel/xe_wedged: Manage verbosity of GT reset fault injection
URL   : https://patchwork.freedesktop.org/series/141810/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15749_full -> IGTPW_12203_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12203_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12203_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12203_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-7/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_busy@close-race:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@gem_busy@close-race.html

  * igt@gem_eio@in-flight-10ms:
    - shard-mtlp:         [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-4/igt@gem_eio@in-flight-10ms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@gem_eio@in-flight-10ms.html

  * igt@gem_exec_schedule@wide:
    - shard-tglu:         [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-5/igt@gem_exec_schedule@wide.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-10/igt@gem_exec_schedule@wide.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-2/igt@gem_tiled_swapping@non-threaded.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][10] -> [INCOMPLETE][11] +2 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
    - shard-mtlp:         [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-4/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
    - shard-dg1:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [SKIP][18] ([i915#11078]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@device_reset@cold-reset-bound.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [TIMEOUT][20] ([i915#12917] / [i915#12964]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-context.html

  
Known issues
------------

  Here are the changes found in IGTPW_12203_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8411]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8411])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][24] +122 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb1/igt@api_intel_bb@object-noreloc-keep-cache-simple.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#11078])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@basics:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#12506]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@drm_fdinfo@basics.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8414]) +14 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#2582])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#7697])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#7697]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#7697]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-clear:
    - shard-rkl:          [PASS][36] -> [DMESG-WARN][37] ([i915#12964]) +52 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-2/igt@gem_create@create-clear.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@gem_create@create-clear.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6335])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8562])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#8562])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#8562])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][42] ([i915#1099]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#8555]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#8555]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#280])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#280])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#280])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#280])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4771])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4771])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#8555])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#6334]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#6334]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#6334]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#6334]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4812])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3539])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3281]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3281]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3281]) +17 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3281]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-hang:
    - shard-rkl:          [PASS][66] -> [DMESG-WARN][67] ([i915#12917] / [i915#12964])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-2/igt@gem_exec_schedule@preempt-hang.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@gem_exec_schedule@preempt-hang.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4812]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4537] / [i915#4812]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4537] / [i915#4812])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4860]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4860])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4860])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#2190])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([i915#2190])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4613]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#12193])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4565])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4613]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4613])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#12936])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][82] ([i915#5493]) +1 other test timeout
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][83] ([i915#4613]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [PASS][84] -> [SKIP][85] ([i915#12936]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-3/igt@gem_lmem_swapping@verify-random.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#4613]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#284])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#284])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#284])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#284])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-6/igt@gem_media_vme.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4083]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4083]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_mmap_wc@read.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4083])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3282]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3282]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][96] ([i915#2658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3282]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][98] ([i915#2658])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][99] ([i915#2658])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][100] ([i915#12964])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4270]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4270]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3282]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#8428]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#5190] / [i915#8428]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#2575] / [i915#5190]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4079])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4885])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-2/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4885])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4077]) +13 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4077]) +23 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4079]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#4079])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4077]) +9 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#3297])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-10/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#3297])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#3297]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#3297]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3297])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3281] / [i915#3297])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3297] / [i915#4958])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3297]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#2527]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#2527] / [i915#2856]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#2527] / [i915#2856])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#2856]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#2527])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@gen9_exec_parse@unaligned-access.html
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#2856]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu-1:       [PASS][129] -> [ABORT][130] ([i915#12817] / [i915#13010] / [i915#9820])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#8399])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][132] ([i915#2681]) +1 other test warn
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [PASS][133] -> [FAIL][134] ([i915#12548] / [i915#3591])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][135] -> [FAIL][136] ([i915#12739] / [i915#3591]) +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][137] -> [SKIP][138] ([i915#13014]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][139] -> [INCOMPLETE][140] ([i915#7790])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb2/igt@i915_pm_rps@reset.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb1/igt@i915_pm_rps@reset.html
    - shard-mtlp:         NOTRUN -> [FAIL][141] ([i915#8346])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#11681]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6245])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#6245])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-3/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#6245])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][146] ([i915#1982] / [i915#9311])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk4/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][147] ([i915#9311]) +1 other test dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][148] ([i915#9311]) +1 other test dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][149] ([i915#9311])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk4/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         NOTRUN -> [ABORT][150] ([i915#13010]) +1 other test abort
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-8/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [PASS][151] -> [DMESG-FAIL][152] ([i915#12964])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-4/igt@i915_suspend@forcewake.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#7707])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-10/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4215] / [i915#5190])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4212]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#4212])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4212])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#8709]) +11 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#8709]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#8709]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#8709]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8709]) +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#9531])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][164] ([i915#1769])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#1769] / [i915#3555])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#5286]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#5286]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#4538] / [i915#5286]) +9 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#5286]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3638]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3638]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4538] / [i915#5190]) +9 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#5190]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#6187]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#4538]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][176] +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#10307] / [i915#6095]) +118 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#12313])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#6095]) +59 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#6095]) +180 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#6095]) +39 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#12313])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][184] +341 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#6095]) +19 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#6095]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#12313]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#12313]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#12313])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#12313]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#6095]) +84 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#7213] / [i915#9010]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3742])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3742])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3742])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#11616] / [i915#7213]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3742])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4087]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#7828]) +9 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#7828]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#7828]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#7828]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#7828]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#7828]) +17 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6944] / [i915#9424])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-8/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9424])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#6944] / [i915#7116] / [i915#7118])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#13049])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#13049])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#13049])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3555]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#13049]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8814]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8814]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][216] ([i915#4423]) +1 other test dmesg-warn
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][217] +15 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#4103] / [i915#4213]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#9809]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dirtyfb@default-dirtyfb-ioctl:
    - shard-dg2:          [PASS][220] -> [SKIP][221] +18 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-1/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_dirtyfb@default-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#9833])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#9833])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][224] ([i915#12170])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][225] ([i915#11968])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#3555]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3555]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3804])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#1257])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#12402])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#12402])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3555] / [i915#3840]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#3840])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#3840])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#1839])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#1839])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#1839]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#1839])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-4/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#1839])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#9337])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#9337])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#658])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#658])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3637]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#3637]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#9934]) +11 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9934]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][248] -> [FAIL][249] ([i915#11989]) +9 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#3637]) +11 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#9934]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          [PASS][252] -> [FAIL][253] ([i915#13027])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-12/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a4:
    - shard-dg1:          NOTRUN -> [FAIL][254] ([i915#13027])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a4.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#8381]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][256] -> [INCOMPLETE][257] ([i915#4839]) +1 other test incomplete
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-mtlp:         [PASS][258] -> [FAIL][259] ([i915#12431])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-4/igt@kms_flip@modeset-vs-vblank-race.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-dg2:          [PASS][260] -> [FAIL][261] ([i915#11989])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-4/igt@kms_flip@wf_vblank-ts-check.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-1/igt@kms_flip@wf_vblank-ts-check.html
    - shard-dg1:          [PASS][262] -> [FAIL][263] ([i915#11989] / [i915#12517])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [PASS][264] -> [FAIL][265] ([i915#11989]) +2 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][266] ([i915#11989]) +2 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-1/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555] / [i915#8813])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#2672] / [i915#8813])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#2672]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#2587] / [i915#2672]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2672]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8813])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8810])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#2587] / [i915#2672]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8810] / [i915#8813])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#3555] / [i915#8810])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#2672] / [i915#3555])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#2587] / [i915#2672])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#8708]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#1825]) +22 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-snb:          [PASS][284] -> [SKIP][285] +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#1825]) +24 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#8708]) +32 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][288] +58 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#5354]) +37 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#8708]) +14 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#3458]) +29 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#9766])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] +29 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#3023]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#3458]) +13 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][296] +85 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][297] +55 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [PASS][298] -> [SKIP][299] ([i915#2575]) +133 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-1/igt@kms_getfb@getfb-handle-closed.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu-1:       [PASS][300] -> [SKIP][301] ([i915#13012] / [i915#13030])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#12713])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8228])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@kms_hdr@static-toggle-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#10656])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#12339])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#12339])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#12339])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#12339])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#6301])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#6301])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#6301])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][316] ([i915#12169])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][317] ([i915#10647]) +1 other test fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8821])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#8821])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#12247]) +21 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12247] / [i915#9423])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12247]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#12247]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [PASS][324] -> [SKIP][325] ([i915#2575] / [i915#9423]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#12247]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#12247] / [i915#6953]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#12247]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#2575] / [i915#9423])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#12247] / [i915#6953] / [i915#9423])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12247]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9812])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][333] ([i915#12912])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][334] -> [SKIP][335] ([i915#4281])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#9340])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9519])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [PASS][338] -> [SKIP][339] ([i915#9519]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#12937])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#6524])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#6524])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#6524])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#6524])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#6524])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#6524] / [i915#6805])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_prime@d3hot.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#2575]) +81 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#9808])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][349] ([i915#11520]) +8 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][350] ([i915#11520]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#11520]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#11520]) +10 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#12316]) +4 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][354] ([i915#11520])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-snb6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#11520]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#11520]) +7 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#4348]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#9683]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#9683]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#9683]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#9688]) +16 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#4423] / [i915#9732])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#9732]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9732]) +16 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#1072] / [i915#9732]) +14 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#1072] / [i915#9732]) +10 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#1072] / [i915#9732]) +35 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#9685]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#9685]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#9685])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#9685])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#9685]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#12755])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#12755])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#3555]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#3555]) +6 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#3555] / [i915#5030] / [i915#9041])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#5030]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#5030] / [i915#9041])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_vblank@wait-forked:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][381] ([i915#12964]) +8 other tests dmesg-warn
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-4/igt@kms_vblank@wait-forked.html
    - shard-dg1:          [PASS][382] -> [DMESG-WARN][383] ([i915#4423])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-17/igt@kms_vblank@wait-forked.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@kms_vblank@wait-forked.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#9906]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#9906])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#3555] / [i915#9906])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-9/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#2437])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][389] ([i915#2437])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk2/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#2437])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#2437])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#2437] / [i915#9412])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-14/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#7387])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@perf@global-sseu-config-invalid.html
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#7387])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#2435])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#2433]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-mtlp:         [PASS][397] -> [FAIL][398] ([i915#10538]) +1 other test fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-2/igt@perf@polling@0-rcs0.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-6/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [PASS][399] -> [SKIP][400] ([i915#12506]) +5 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [PASS][401] -> [FAIL][402] ([i915#4349])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-3/igt@perf_pmu@busy-double-start@ccs0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-10/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-dg1:          [PASS][403] -> [FAIL][404] ([i915#4349]) +2 other tests fail
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs0.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#8850])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [PASS][406] -> [ABORT][407] ([i915#13010]) +1 other test abort
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-9/igt@perf_pmu@module-unload.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-3/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#8516])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][409] ([i915#9351])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][410] ([i915#9351])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#3708] / [i915#4077])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#3291] / [i915#3708])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#3708]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-12/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#10216] / [i915#3708])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#9917])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#9917])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#4818])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg1-17/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-dg2:          [SKIP][418] -> [PASS][419] +20 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@api_intel_allocator@two-level-inception-interruptible.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][420] ([i915#12866]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@core_getversion@basic.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-8/igt@core_getversion@basic.html

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         [ABORT][422] -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-7/igt@debugfs_test@read_all_entries_display_off.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_off.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][424] ([i915#12817] / [i915#5507]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][426] ([i915#2582]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@fbdev@eof.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@fbdev@eof.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [PASS][429] +154 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-6/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][430] ([i915#11441]) -> [PASS][431] +1 other test pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          [SKIP][432] ([i915#12936]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-3/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][434] ([i915#5566]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [ABORT][436] ([i915#13010]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-tglu-9/igt@i915_module_load@reload.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-tglu-7/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][438] ([i915#10131] / [i915#9820]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          [SKIP][440] ([i915#13014]) -> [PASS][441] +1 other test pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][442] ([i915#7984]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15749/shard-mtlp-8/igt@i915_power@sanity.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/shard-mtlp-3/igt@i915_power@sanity.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FA

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12203/index.html
