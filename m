Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6195E668B3
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 15:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831CB10E092;
	Sun, 24 Nov 2024 15:18:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238610E05C;
 Sun, 24 Nov 2024 15:18:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_GPGPU_fill_improvements_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 15:18:08 -0000
Message-ID: <173246148881.2497777.5018382178803051832@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
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

Series: GPGPU fill improvements (rev6)
URL   : https://patchwork.freedesktop.org/series/141352/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15727_full -> IGTPW_12171_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12171_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12171_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12171_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][1] -> [DMESG-FAIL][2] +3 other tests dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-dg2:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_ctx_persistence@smoketest.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_schedule@preempt-queue-contexts@vecs0:
    - shard-rkl:          [PASS][5] -> [DMESG-WARN][6] +49 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_exec_schedule@preempt-queue-contexts@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@gem_exec_schedule@preempt-queue-contexts@vecs0.html

  * igt@gem_exec_schedule@wide@rcs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][7] +6 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@gem_exec_schedule@wide@rcs0.html

  * {igt@gem_gpgpu_fill@offset-16x16} (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@gem_gpgpu_fill@offset-16x16.html
    - shard-rkl:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@gem_gpgpu_fill@offset-16x16.html
    - shard-dg1:          NOTRUN -> [FAIL][10] +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@gem_gpgpu_fill@offset-16x16.html
    - shard-tglu:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@gem_gpgpu_fill@offset-16x16.html

  * igt@gem_spin_batch@legacy@render:
    - shard-snb:          [PASS][12] -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@gem_spin_batch@legacy@render.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb1/igt@gem_spin_batch@legacy@render.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb6/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [ABORT][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-rkl:          [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@i915_pm_rpm@gem-pread.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [PASS][19] -> [WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@i915_suspend@basic-s2idle-without-i915.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-tglu:         [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@i915_suspend@basic-s2idle-without-i915.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][23] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][24] -> [INCOMPLETE][25] +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][26] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          [PASS][27] -> [SKIP][28] +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@perf@create-destroy-userspace-config.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@perf@create-destroy-userspace-config.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][29] ([i915#12917]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][31] ([i915#2575]) -> [SKIP][32] +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][33] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15727_full and IGTPW_12171_full:

### New IGT tests (1) ###

  * igt@gem_gpgpu_fill@offset-16x16:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_12171_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8411]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#8411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#6230])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@api_intel_bb@crc32.html

  * igt@core_getversion@all-cards:
    - shard-dg2:          [PASS][37] -> [FAIL][38] ([i915#12869])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@core_getversion@all-cards.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#9318])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#11078])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8414]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#8414]) +16 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-dg2:          [PASS][43] -> [SKIP][44] ([i915#12506]) +9 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@drm_fdinfo@virtual-idle.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][45] -> [SKIP][46] ([i915#2582]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@fbdev@eof.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@fbdev@eof.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3555] / [i915#9323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3555] / [i915#9323])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#3555] / [i915#9323])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#9323])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][51] ([i915#12392] / [i915#7297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#7697])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][53] ([i915#7697])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [PASS][54] -> [SKIP][55] ([i915#2575]) +161 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@gem_ctx_exec@basic-nohangcheck.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#2575]) +54 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#8555])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#8555]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][59] ([i915#1099]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#280])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#280])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][62] -> [FAIL][63] ([i915#12543] / [i915#5784])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-13/igt@gem_eio@reset-stress.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4812]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#6334]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#6344])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3281]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3281]) +14 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3281]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4537] / [i915#4812])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][73] ([i915#7975] / [i915#8213]) +1 other test abort
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-dg1:          [PASS][74] -> [INCOMPLETE][75] ([i915#7975]) +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4860]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2190])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [PASS][78] -> [SKIP][79] ([i915#12936]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@gem_lmem_swapping@parallel-multi.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#4613]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4613]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4613]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html
    - shard-tglu-1:       NOTRUN -> [SKIP][83] ([i915#4613]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#12193]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4565]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4083]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +13 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4083]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@gem_mmap_wc@bad-size.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][91] ([i915#2658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#4270])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4270]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4270]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2575] / [i915#5190]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4079])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4885])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#3297]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#3297] / [i915#3323])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#4880])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#2527] / [i915#2856]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#2527]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][111] -> [ABORT][112] ([i915#9820])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#8399]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#6590]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6590]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#11681] / [i915#6621])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#11681] / [i915#6621])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#11681])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4387])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5723])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#5723])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][123] ([i915#9311])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#7707])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#5190]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4212]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][127] ([i915#4423])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          NOTRUN -> [FAIL][128] ([i915#12518] / [i915#12766])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#8709]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#8709]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#6228])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#5286]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#5286])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5286]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3638]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3638]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#6095]) +29 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] +32 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#6095]) +220 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][147] +403 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#6095]) +109 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6095]) +79 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6095]) +98 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12805])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +11 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12313]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#12313]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#11616] / [i915#7213])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4087]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#7828]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#7828]) +12 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3299])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#9424]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7116] / [i915#9424]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#12976]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#12976]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#12976])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3555]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-rkl:          [PASS][175] -> [DMESG-WARN][176] ([i915#12917])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#4103] / [i915#4213])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#4103]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5354]) +15 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][181] ([i915#2346])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#9833])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#9723])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#8588])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#8588])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#8588])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3804])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#1257])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#3840]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3840])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3840] / [i915#9053])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#3469])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#1839])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#1839])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][199] -> [FAIL][200] ([i915#2122]) +6 other tests fail
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#9934]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#8381])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3637]) +10 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#9934]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#3637]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-fences-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][206] ([i915#12964]) +3 other tests dmesg-warn
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_flip@flip-vs-fences-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][207] ([i915#6113])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
    - shard-dg1:          NOTRUN -> [INCOMPLETE][208] ([i915#6113])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-tglu:         [PASS][209] -> [FAIL][210] ([i915#2122])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][211] ([i915#2122]) +1 other test fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#2672] / [i915#3555])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#2587] / [i915#2672])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#2672]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555] / [i915#5190])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +6 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#2672]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5274])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][224] -> [SKIP][225] +21 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#8708]) +19 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#10055])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#10433] / [i915#3458])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#8708]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][230] +60 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#1825]) +18 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][232] +96 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#3458]) +26 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#5439])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#5439])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#9766])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3023]) +10 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3458]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] +53 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#12713])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][246] -> [SKIP][247] ([i915#12388])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#12394])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#12339])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#12388])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#12394])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#12339])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][254] ([i915#12169])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][255] ([i915#10647]) +1 other test fail
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#3555]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#12247]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#2575] / [i915#9423])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#12247]) +8 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#12247]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#12247] / [i915#6953])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#12247] / [i915#6953])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#12247]) +17 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][265] -> [SKIP][266] ([i915#2575] / [i915#9423]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12247] / [i915#6953])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12247]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#9812])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#9685])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#9685])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9685])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9340])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#8430])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#8430])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#8430])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#12937]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][279] -> [SKIP][280] ([i915#9519])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9519]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12937])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#9519])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][284] -> [SKIP][285] ([i915#12916])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#6524])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#6524]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][288] ([i915#11520]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#11520]) +7 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#11520]) +9 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#11520]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#11520]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#11520]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#11520]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9683]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#1072] / [i915#9732]) +28 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#1072] / [i915#9732]) +12 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#9732]) +26 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#1072] / [i915#9732]) +12 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9732]) +11 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#12755])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#5289])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#5289]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#5289])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#12755] / [i915#5190])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#5289])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#3555]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#3555]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][309] ([IGT#2] / [i915#6493])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@wait-forked:
    - shard-rkl:          [PASS][310] -> [DMESG-WARN][311] ([i915#12964]) +7 other tests dmesg-warn
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_vblank@wait-forked.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_vblank@wait-forked.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9906])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#9906])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#9906]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#2437])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-10/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#2437])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#12506]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#2433])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-17/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][319] ([i915#4349]) +4 other tests fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#8850])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#8850])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#8516])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#8516])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][324] ([i915#9351])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][325] ([i915#9351])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3708])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#3708] / [i915#4077])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#3291] / [i915#3708])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#9917]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][330] ([i915#12910]) +8 other tests fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-10/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][331] +152 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb2/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][332] +8 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#4818])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][334] ([i915#11703]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@core_hotunplug@unbind-rebind.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb4/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][336] -> [PASS][337] +46 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][338] ([i915#2582]) -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@fbdev@nullptr.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@fbdev@nullptr.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][340] ([i915#9561]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@gem_ctx_freq@sysfs.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-rkl:          [DMESG-WARN][342] ([i915#12964]) -> [PASS][343] +9 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          [SKIP][344] ([i915#12936]) -> [PASS][345] +2 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu:         [SKIP][346] ([i915#4270]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][348] ([i915#2575]) -> [PASS][349] +139 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@gem_vm_create@execbuf.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][350] ([i915#9820]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [ABORT][352] -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][354] ([i915#12548] / [i915#3591]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [FAIL][356] ([i915#12739] / [i915#3591]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][358] -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-rkl:          [INCOMPLETE][360] ([i915#4817]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [SKIP][362] -> [PASS][363] +23 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [DMESG-WARN][364] ([i915#12917]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu:         [FAIL][366] ([i915#2122]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][368] ([i915#11989]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][370] ([i915#2122]) -> [PASS][371] +5 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [FAIL][372] ([i915#11989] / [i915#2122]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg1:          [FAIL][374] ([i915#11989] / [i915#12517] / [i915#2122]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-18/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          [FAIL][376] ([i915#2122]) -> [PASS][377] +2 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][378] -> [PASS][379] +7 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][380] -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [ABORT][382] -> [PASS][383] +2 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@kms_plane@pixel-format-source-clamping.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [SKIP][384] ([i915#2575] / [i915#9423]) -> [PASS][385] +4 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][386] ([i915#9295]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][388] ([i915#4281]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][390] ([i915#12937]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][392] ([i915#9519]) -> [PASS][393] +2 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][394] -> [PASS][395] +1 other test pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][396] ([i915#12506]) -> [PASS][397] +4 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-8/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [FAIL][398] ([i915#10538]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@perf@polling@0-rcs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@perf@polling@0-rcs0.html

  * igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - shard-dg1:          [DMESG-WARN][400] ([i915#4423]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg1-12/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][402] ([i915#8411]) -> [SKIP][403] ([i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          [SKIP][404] ([i915#8414]) -> [SKIP][405] ([i915#12506]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@drm_fdinfo@isolation.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@drm_fdinfo@isolation.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [INCOMPLETE][407] ([i915#7297])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#8555])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#280])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#3539])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-2/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#3539] / [i915#4852])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          [SKIP][416] ([i915#3539] / [i915#4852]) -> [SKIP][417] ([i915#2575]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_exec_flush@basic-wb-rw-default.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][418] ([i915#3281]) -> [SKIP][419] ([i915#2575]) +6 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#3281]) +4 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][422] ([i915#4537] / [i915#4812]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][424] ([i915#4860]) -> [SKIP][425] ([i915#2575]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#4860]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#4077]) +8 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          [SKIP][430] ([i915#4077]) -> [SKIP][431] ([i915#2575]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@gem_mmap_gtt@hang.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#4083]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_wc@fault-concurrent.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-7/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          [SKIP][434] ([i915#4083]) -> [SKIP][435] ([i915#2575]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-8/igt@gem_mmap_wc@invalid-flags.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#3282])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          [SKIP][438] ([i915#3282]) -> [SKIP][439] ([i915#2575]) +2 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_pread@snoop.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][440] ([i915#4270]) -> [TIMEOUT][441] ([i915#12964])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][442] ([i915#12917]) -> [SKIP][443] ([i915#4270])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@gem_pxp@display-protected-crc.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#4270])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_pxp@fail-invalid-protected-context.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-4/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          [SKIP][446] ([i915#4270]) -> [SKIP][447] ([i915#2575]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][448] ([i915#4270]) -> [TIMEOUT][449] ([i915#12917])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/shard-rkl-1/igt@g

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12171/index.html
