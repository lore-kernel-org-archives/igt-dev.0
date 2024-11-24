Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7575E66894
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 10:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167110E00D;
	Sun, 24 Nov 2024 10:22:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FCF10E00D;
 Sun, 24 Nov 2024 10:22:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/gem=5Fmmap=5Foffse?=
 =?utf-8?q?t=3A_Fix_OOM_hits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 10:22:45 -0000
Message-ID: <173244376569.2400440.7773781346632156277@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121104039.314188-4-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20241121104039.314188-4-janusz.krzysztofik@linux.intel.com>
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

Series: tests/gem_mmap_offset: Fix OOM hits
URL   : https://patchwork.freedesktop.org/series/141643/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15725_full -> IGTPW_12156_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12156_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12156_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12156_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][3] -> [DMESG-FAIL][4] +4 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_offset@clear:
    - shard-dg1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-12/igt@gem_mmap_offset@clear.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@gem_mmap_offset@clear.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb6/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][11] -> [FAIL][12] +37 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@i915_selftest@live@objects.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         NOTRUN -> [ABORT][13] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][15] -> [DMESG-WARN][16] +63 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][17] +12 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][18] +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          NOTRUN -> [SKIP][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [PASS][22] -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@syncobj_wait@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@syncobj_wait@multi-wait-for-submit-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][25] ([i915#4270]) -> [TIMEOUT][26] +1 other test timeout
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          [SKIP][27] ([i915#2575]) -> [SKIP][28] +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][29] ([i915#9519]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][31] ([i915#9100]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@perf@non-zero-reason.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          [FAIL][33] ([i915#4349]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@perf_pmu@busy-double-start.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][35] +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15725_full and IGTPW_12156_full:

### New IGT tests (6) ###

  * igt@gem_mmap_offset@clear-via-pagefault:
    - Statuses : 4 pass(s)
    - Exec time: [22.73, 49.77] s

  * igt@gem_mmap_offset@clear-via-pagefault@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [22.39] s

  * igt@gem_mmap_offset@clear-via-pagefault@smem0:
    - Statuses : 4 pass(s)
    - Exec time: [22.73, 27.39] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_12156_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#8411])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8411])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#9318])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#11078])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#12506]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8414]) +32 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#8414]) +25 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][43] -> [SKIP][44] ([i915#1849] / [i915#2582])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@fbdev@info.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#2582])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@fbdev@write:
    - shard-dg2:          [PASS][46] -> [SKIP][47] ([i915#2582])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@fbdev@write.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@fbdev@write.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3936])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3555] / [i915#9323])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#9323])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#9323])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#9323])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#3555] / [i915#9323])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#9323])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#7697])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#7697])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#6335])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#8562])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#8562])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][60] ([i915#1099]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb1/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#8555]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][62] ([i915#11980] / [i915#12580])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#280])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#280])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#280])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][66] ([i915#10030] / [i915#7975] / [i915#8213])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4771])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4036])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][69] ([i915#11713])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#6334]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4812]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3539] / [i915#4852]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3539])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539] / [i915#4852])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3281]) +14 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3281]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3281]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4537] / [i915#4812])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4860]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4860]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#2190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#4613])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#12936]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][84] ([i915#4613]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#4613]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#4613]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#12193]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4565]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#284])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4077]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4083]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4083]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][93] ([i915#2658]) +1 other test warn
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3282])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3282]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][96] ([i915#2658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#4270])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][99] ([i915#12917])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4270]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglu:         [PASS][101] -> [SKIP][102] ([i915#4270])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3282]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#2575] / [i915#5190]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#5190] / [i915#8428]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4079])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4079])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#4885])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4885])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4077]) +16 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#3297] / [i915#3323])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297] / [i915#4880]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#3297] / [i915#4880])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3297]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#3297]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3297]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#3297]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_wait@await:
    - shard-dg2:          [PASS][118] -> [SKIP][119] ([i915#2575]) +155 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@gem_wait@await.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_wait@await.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][120] +44 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#2527]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#2527] / [i915#2856])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#2527]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#2527] / [i915#2856]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#2856]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681] / [i915#6621])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#6188])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5723])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][129] ([i915#1982] / [i915#9311])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][130] ([i915#9311])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][131] ([i915#9311])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#7707])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4212]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#12454] / [i915#12712])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#1769] / [i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#5286]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#5286]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3638]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][144] -> [SKIP][145] +33 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#5190]) +7 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][147] +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][149] +107 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4538]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#10307] / [i915#6095]) +125 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#12313])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#6095]) +34 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12805])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#12805])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6095]) +104 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#6095]) +21 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#6095]) +85 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#12313])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#12313]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#6095]) +187 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3742])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#3742])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7828]) +15 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#7828]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7828]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#7828]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#7828]) +11 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3116] / [i915#3299]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#6944] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#7116])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#7162] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3555]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#12976])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#12976])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#12976])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3555]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#12976])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-rkl:          [PASS][187] -> [DMESG-WARN][188] ([i915#12964]) +2 other tests dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][189] ([i915#12917]) +1 other test dmesg-warn
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#4103])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][192] ([i915#4423]) +1 other test dmesg-warn
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#9723])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#8588])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3804])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#8812])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3840])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#3840]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3469])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3469])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#2065] / [i915#4854])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#1839]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#658])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3637]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3637]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#8381]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2575]) +88 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#9934]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#9934]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg1:          [PASS][214] -> [DMESG-WARN][215] ([i915#4423])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-13/igt@kms_flip@dpms-vs-vblank-race.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#8381]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [PASS][217] -> [INCOMPLETE][218] ([i915#4839] / [i915#6113])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@kms_flip@flip-vs-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][219] ([i915#6113])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][220] ([i915#4839] / [i915#6113]) +1 other test incomplete
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [PASS][221] -> [FAIL][222] ([i915#11989] / [i915#2122])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [PASS][223] -> [FAIL][224] ([i915#2122]) +2 other tests fail
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [PASS][225] -> [FAIL][226] ([i915#2122]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][227] -> [FAIL][228] ([i915#2122]) +5 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][229] ([i915#2122]) +2 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][230] ([i915#11989])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][231] ([i915#2122])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#2587] / [i915#2672]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#2672]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-rkl:          [PASS][241] -> [DMESG-WARN][242] ([i915#12917])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_flip_tiling@flip-change-tiling.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5274])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [PASS][244] -> [FAIL][245] ([i915#6880]) +2 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8708]) +10 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5354]) +26 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][248] -> [SKIP][249] +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1825]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#5439]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][252] +56 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#8708]) +27 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3458]) +11 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#3458] / [i915#4423])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3023]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#4423])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] +39 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3458]) +19 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8228]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#12713])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#3555] / [i915#8228])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8228])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12388])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#12339]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#6301]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#6301])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#6301])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][270] ([i915#12178])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][271] ([i915#7862]) +1 other test fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][272] ([i915#12169])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][273] ([i915#10647]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12247] / [i915#9423]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12247]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#12247]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#2575] / [i915#9423]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#12247]) +18 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#12247]) +15 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#6953])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#12247] / [i915#6953])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12247]) +13 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [PASS][285] -> [SKIP][286] ([i915#2575] / [i915#9423]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][287] +70 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb6/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9812]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9685]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#9685])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#3828])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#5978])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#4281])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][294] -> [SKIP][295] ([i915#9340])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#8430])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#12937])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@kms_pm_rpm@basic-rte.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#9519]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9519]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#12937]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#9519])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([Intel XE#3529])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#11520]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#11520]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][307] ([i915#11520]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#11520]) +8 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#11520]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#11520]) +11 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#9683])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9732]) +27 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-6/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#9732]) +9 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#1072] / [i915#9732]) +13 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#1072] / [i915#9732]) +8 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-7/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +31 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][317] +281 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#5289])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#5289])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#8623])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#9906]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#9906])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3555] / [i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-14/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#9906]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#9906])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#9906])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#2437])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][329] ([i915#2437])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-glk1/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#2437])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#2437] / [i915#9412])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#2437]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-13/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [PASS][333] -> [SKIP][334] ([i915#12506]) +8 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@perf@invalid-remove-userspace-config.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#2434])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#2433])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][337] ([i915#4349]) +1 other test fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#8516])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#8516])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-4/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#8516])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#3291] / [i915#3708])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#3291] / [i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#3708] / [i915#4077])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#3708] / [i915#4077])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#9917])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#9917]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][348] ([i915#12910]) +19 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#9917])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][350] ([i915#12564] / [i915#9781])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-7/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][351] -> [FAIL][352] ([i915#12875])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@tools_test@tools_test.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][353] ([i915#2582]) -> [PASS][354] +2 other tests pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@fbdev@eof.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@fbdev@eof.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][355] ([i915#11980] / [i915#12580]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-2/igt@gem_ctx_persistence@hostile.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_fence@syncobj-repeat:
    - shard-rkl:          [DMESG-WARN][357] -> [PASS][358] +2 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_exec_fence@syncobj-repeat.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-5/igt@gem_exec_fence@syncobj-repeat.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][359] ([i915#12817] / [i915#9820]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-rkl:          [SKIP][361] ([i915#12964]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@i915_pm_rpm@sysfs-read.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][363] ([i915#2346]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][365] ([i915#12917]) -> [PASS][366] +2 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          [DMESG-WARN][367] ([i915#4423]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [DMESG-FAIL][369] ([i915#12964]) -> [PASS][370] +1 other test pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][371] ([i915#2122]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_flip@plain-flip-fb-recreate.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-dg1:          [FAIL][373] ([i915#12517] / [i915#12996] / [i915#2122]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-13/igt@kms_flip@plain-flip-fb-recreate.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-17/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [FAIL][375] ([i915#2122]) -> [PASS][376] +13 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][377] ([i915#2122]) -> [PASS][378] +9 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][379] -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [SKIP][381] -> [PASS][382] +22 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          [SKIP][383] -> [PASS][384] +3 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [SKIP][385] ([i915#2575]) -> [PASS][386] +121 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][387] ([i915#12964]) -> [PASS][388] +59 other tests pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [SKIP][389] ([i915#2575] / [i915#9423]) -> [PASS][390] +4 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][391] ([i915#12937]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][393] ([i915#9519]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][395] ([i915#3555] / [i915#9906]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@kms_vrr@negative-basic.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@kms_vrr@negative-basic.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-rkl:          [FAIL][397] ([i915#10538]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][399] -> [PASS][400] +2 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-4/igt@perf_pmu@module-unload.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-tglu-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [SKIP][401] -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-rkl-4/igt@perf_pmu@rc6@runtime-pm-gt0.html

  * igt@perf_pmu@render-node-busy:
    - shard-dg2:          [SKIP][403] ([i915#12506]) -> [PASS][404] +4 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@perf_pmu@render-node-busy.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-8/igt@perf_pmu@render-node-busy.html

  * igt@sw_sync@timeline_closed:
    - shard-dg1:          [INCOMPLETE][405] -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-17/igt@sw_sync@timeline_closed.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg1-12/igt@sw_sync@timeline_closed.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][407] ([i915#8411]) -> [SKIP][408] ([i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-7/igt@api_intel_bb@object-reloc-keep-cache.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][409] ([i915#2575]) -> [SKIP][410] ([i915#8411])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          [SKIP][411] ([i915#8414]) -> [SKIP][412] ([i915#12506])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@drm_fdinfo@isolation.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          [SKIP][413] ([i915#12506]) -> [SKIP][414] ([i915#8414])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-6/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][415] ([i915#8555]) -> [SKIP][416] ([i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-close.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [FAIL][417] ([i915#11980] / [i915#12580]) -> [SKIP][418] ([i915#2575])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-6/igt@gem_ctx_persistence@hostile.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_capture@capture:
    - shard-dg2:          [FAIL][419] ([i915#11965] / [i915#12558]) -> [SKIP][420] ([i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_exec_capture@capture.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_exec_capture@capture.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][421] ([i915#2575]) -> [SKIP][422] ([i915#4812])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_fence@concurrent.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-3/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          [SKIP][423] ([i915#3539] / [i915#4852]) -> [SKIP][424] ([i915#2575]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          [SKIP][425] ([i915#3539]) -> [SKIP][426] ([i915#2575])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-5/igt@gem_exec_flush@basic-uc-prw-default.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [SKIP][428] ([i915#3539])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [SKIP][430] ([i915#3539] / [i915#4852])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          [SKIP][431] ([i915#2575]) -> [SKIP][432] ([i915#3281]) +5 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_reloc@basic-active.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          [SKIP][433] ([i915#3281]) -> [SKIP][434] ([i915#2575]) +6 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          [SKIP][435] ([i915#2575]) -> [SKIP][436] ([i915#4537] / [i915#4812])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          [SKIP][437] ([i915#4537] / [i915#4812]) -> [SKIP][438] ([i915#2575])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_exec_schedule@semaphore-power.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          [SKIP][439] ([i915#4860]) -> [SKIP][440] ([i915#2575]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_linear_blits@interruptible:
    - shard-dg2:          [INCOMPLETE][441] -> [SKIP][442] ([i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_linear_blits@interruptible.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-11/igt@gem_linear_blits@interruptible.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          [SKIP][443] ([i915#2575]) -> [SKIP][444] ([i915#8289])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_media_fill@media-fill.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/shard-dg2-2/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [SKIP][446] ([i915#4083]) +2 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_mmap@short-mmap.html
   [446]: https://intel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12156/index.html
