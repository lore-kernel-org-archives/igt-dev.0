Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646EFE6780A
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 21:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F340910E008;
	Sun, 24 Nov 2024 21:21:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55E10E008;
 Sun, 24 Nov 2024 21:21:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_new_test_to_validate?=
 =?utf-8?q?_adaptive_sharpness_filter_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 21:21:29 -0000
Message-ID: <173248328945.2585149.1121789729648338829@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122185708.1755203-1-swati2.sharma@intel.com>
In-Reply-To: <20241122185708.1755203-1-swati2.sharma@intel.com>
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

Series: Add new test to validate adaptive sharpness filter (rev9)
URL   : https://patchwork.freedesktop.org/series/130218/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15733_full -> IGTPW_12181_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12181_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12181_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12181_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@wide:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@gem_exec_schedule@wide.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [PASS][2] -> [SKIP][3] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-5/igt@gem_lmem_evict@dontneed-evict-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_module_load@reload:
    - shard-tglu:         NOTRUN -> [ABORT][5] +2 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-rkl:          [PASS][6] -> [SKIP][7] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-7/igt@i915_pm_rpm@gem-mmap-type.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-2/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][8] -> [FAIL][9] +37 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-10/igt@i915_selftest@live@objects.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][10] -> [DMESG-FAIL][11] +2 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][13] -> [DMESG-WARN][14] +60 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][15] +15 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [PASS][16] -> [ABORT][17] +4 other tests abort
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-4/igt@kms_plane@pixel-format-source-clamping.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][18] +14 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_sharpness_filter@filter-rotations (NEW):
    - {shard-dg2-9}:      NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-9/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_sharpness_filter@filter-scaler-downscale (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][20] +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-2/igt@kms_sharpness_filter@filter-scaler-downscale.html
    - shard-dg1:          NOTRUN -> [SKIP][21] +11 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@filter-toggle (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][22] +12 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@prime_busy@hang-wait@rcs0:
    - shard-rkl:          [PASS][23] -> [INCOMPLETE][24] +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-3/igt@prime_busy@hang-wait@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@prime_busy@hang-wait@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          [SKIP][25] ([i915#4077]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-rkl:          [DMESG-WARN][27] -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][29] ([i915#2575]) -> [SKIP][30] +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-suspend:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][31] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - {shard-dg2-9}:      NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15733_full and IGTPW_12181_full:

### New IGT tests (17) ###

  * igt@i915_hangman:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-basic:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-dpms:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-formats:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_sharpness_filter@filter-modifiers:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_sharpness_filter@filter-rotations:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-strength:
    - Statuses : 6 skip(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_sharpness_filter@filter-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@filter-tap:
    - Statuses : 5 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_sharpness_filter@filter-toggle:
    - Statuses : 4 skip(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_12181_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#8411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6230])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][36] -> [FAIL][37] ([i915#12909])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-4/igt@core_setmaster@master-drop-set-root.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#11078])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8414]) +16 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#8414])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][41] -> [SKIP][42] ([i915#2582])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-10/igt@fbdev@pan.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#7697])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-5/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#7697])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][46] ([i915#7297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-clear:
    - shard-rkl:          [PASS][47] -> [DMESG-WARN][48] ([i915#12964]) +6 other tests dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-4/igt@gem_create@create-clear.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@gem_create@create-clear.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#8562])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [PASS][50] -> [INCOMPLETE][51] ([i915#12353]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#8555]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          NOTRUN -> [FAIL][53] ([i915#11980] / [i915#12580])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@gem_ctx_persistence@hostile.html
    - shard-tglu-1:       NOTRUN -> [FAIL][54] ([i915#11980] / [i915#12580])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][55] ([i915#11980] / [i915#12580])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][56] ([i915#1099])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#280]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#280])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4812]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4036])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][61] ([i915#11713])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#6334]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][63] ([i915#11965] / [i915#12558]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][64] ([i915#11965]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3539])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3539])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3281]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3281]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4537] / [i915#4812]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4812]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][73] ([i915#11441]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4860]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4860]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-dg2:          [PASS][76] -> [SKIP][77] ([i915#12936])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-7/igt@gem_lmem_swapping@heavy-random.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4613]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#4613])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#4613]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([i915#4613]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][82] ([i915#5493]) +1 other test timeout
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][83] ([i915#5493]) +1 other test timeout
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +12 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4077]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4083]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][91] ([i915#2658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#4270])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#4270])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-3/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#12975])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4270]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu:         [PASS][97] -> [SKIP][98] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4079])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3282] / [i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#3297]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297] / [i915#4958])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#2527]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#2856]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#2527] / [i915#2856])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][114] ([i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#8399]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-10/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [PASS][116] -> [FAIL][117] ([i915#12548] / [i915#3591])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][118] -> [FAIL][119] ([i915#12739] / [i915#3591])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4387])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          [PASS][123] -> [ABORT][124] ([i915#12450])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb1/igt@i915_suspend@basic-s2idle-without-i915.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb7/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-dg1:          [PASS][125] -> [DMESG-WARN][126] ([i915#4391] / [i915#4423])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-14/igt@i915_suspend@basic-s2idle-without-i915.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4212]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4212]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#8709]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#8709]) +11 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#5286]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#5286])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3638]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +9 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3638]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][139] +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#5190]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +163 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6095]) +84 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6095]) +102 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#12313]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#10307] / [i915#6095]) +121 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#12313]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#12805])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#6095]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12313]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#6095]) +19 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#10434] / [i915#6095])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4087]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#7828]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#7828]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#7828]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7828])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][159] +89 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb2/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#7118] / [i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7116] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3299])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#6944] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-2/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#7118])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#6944] / [i915#7116] / [i915#7118])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][170] ([i915#12964])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3555]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#12976]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#12976]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#12976]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#12976])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#12976])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#3555]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][178] ([i915#4423])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5354]) +33 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9067])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#4103])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#4103])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][184] ([i915#12638])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#8588])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#1257])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#1257])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#1257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-10/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#12402])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#8812])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3840] / [i915#9688])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#3840]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3840] / [i915#9053])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3840] / [i915#9053])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3840] / [i915#9053])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3955])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3469])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#4854])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_feature_discovery@chamelium.html
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#2065] / [i915#4854])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#1839])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#1839])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#9337])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#658])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3637]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#8381]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#8381])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#9934])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#9934]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#3637]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-snb:          [PASS][215] -> [FAIL][216] ([i915#2122]) +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][217] ([i915#2122]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672] / [i915#3555])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#2672]) +8 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#2587] / [i915#2672] / [i915#3555])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2587] / [i915#2672] / [i915#3555])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][230] -> [SKIP][231] +22 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][232] -> [DMESG-WARN][233] ([i915#12917])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][234] -> [SKIP][235] +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#1825]) +13 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][237] +39 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8708]) +12 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] +22 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8708]) +17 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#9766])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3458]) +14 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][243] +93 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3458]) +11 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#3023]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#10656])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#12394])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#1839])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#6301]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#6301])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][256] ([i915#12178])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][257] ([i915#7862]) +1 other test fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][258] ([i915#12177])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk4/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][259] ([i915#10647]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk4/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#12247] / [i915#9423])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#12247]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#12247]) +8 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#2575] / [i915#9423]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#12247] / [i915#6953])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#12247]) +32 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#12247]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#2575] / [i915#9423]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247] / [i915#6953])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#12247] / [i915#3555])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12247] / [i915#3555])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#12247] / [i915#3555])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#6953] / [i915#9423])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#12247]) +7 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#12343])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#9812])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#5354])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#5354])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][279] -> [FAIL][280] ([i915#9295])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][281] -> [SKIP][282] ([i915#4281])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#8430])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#12937]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-6/igt@kms_pm_rpm@drm-resources-equal.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][286] -> [SKIP][287] ([i915#9519])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9519]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][290] -> [SKIP][291] ([i915#12916])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#12937])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#6524])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([Intel XE#3529])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#11520]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][296] ([i915#11520])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#11520])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#11520]) +10 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#11520]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][300] ([i915#11520]) +8 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#11520]) +7 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9683])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#1072] / [i915#9732]) +22 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#9732]) +27 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-5/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#9732]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#1072] / [i915#9732]) +23 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-14/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][308] +49 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][309] +301 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#9685])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9685])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#4235])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#2575] / [i915#5190]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#5289])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#12755]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#3555])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-modifiers (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#2575]) +90 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][318] ([IGT#2])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][319] ([IGT#2] / [i915#6493])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#8623])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#8623])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#11920])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#11920])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#3555] / [i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-10/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9906]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9906]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9906])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#9906]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#9906])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#2437] / [i915#9412])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#2437] / [i915#9412]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#2437] / [i915#9412])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#2437]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#2437])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#7387])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@perf@global-sseu-config.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#12506]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@perf@stress-open-close.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [PASS][337] -> [SKIP][338] ([i915#12506]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-1/igt@perf_pmu@all-busy-check-all.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][339] ([i915#4349]) +3 other tests fail
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][340] ([i915#11823])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#8516])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-dg2:          [PASS][342] -> [FAIL][343] ([i915#4349]) +5 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-4/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@perf_pmu@render-node-busy-idle@vcs0.html
    - shard-dg1:          [PASS][344] -> [FAIL][345] ([i915#4349]) +3 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-18/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#3291] / [i915#3708])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#9917]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-18/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][348] ([i915#12910]) +20 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-10/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#9917])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [PASS][350] -> [SKIP][351] ([i915#2575]) +138 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-1/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [SKIP][352] ([i915#2575]) -> [PASS][353] +125 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][354] ([i915#12714] / [i915#5784]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][356] ([i915#7975] / [i915#8213]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-3/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [SKIP][358] ([i915#12936]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_lmem_swapping@verify-ccs.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][360] -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][362] -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-2/igt@gem_workarounds@suspend-resume-context.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [FAIL][364] ([i915#12870]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@i915_module_load@reload.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][366] ([i915#12964]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          [FAIL][368] ([i915#12238]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-glk:          [FAIL][370] ([i915#11859]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          [SKIP][372] -> [PASS][373] +15 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-dg1:          [DMESG-WARN][374] ([i915#4423]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][376] ([i915#2122]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-dg2:          [FAIL][378] ([i915#10826]) -> [PASS][379] +1 other test pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][380] ([i915#2122]) -> [PASS][381] +9 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [FAIL][382] ([i915#6880]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [SKIP][384] -> [PASS][385] +6 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][386] -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [INCOMPLETE][388] ([i915#12756]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][390] ([i915#12964]) -> [PASS][391] +11 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          [SKIP][392] ([i915#2575] / [i915#9423]) -> [PASS][393] +3 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [SKIP][394] ([i915#12937]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@kms_pm_rpm@cursor.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][396] ([i915#9519]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][398] ([i915#9519]) -> [PASS][399] +3 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-rkl:          [DMESG-WARN][400] ([i915#12917]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-3/igt@kms_prime@basic-crc-vgem.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_sysfs_edid_timing:
    - shard-snb:          [FAIL][402] ([IGT#2] / [i915#6493]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-snb7/igt@kms_sysfs_edid_timing.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-snb1/igt@kms_sysfs_edid_timing.html

  * igt@perf_pmu@busy-accuracy-50:
    - shard-rkl:          [DMESG-WARN][404] -> [PASS][405] +59 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-4/igt@perf_pmu@busy-accuracy-50.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-7/igt@perf_pmu@busy-accuracy-50.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [SKIP][406] ([i915#12506]) -> [PASS][407] +4 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][408] ([i915#4349]) -> [PASS][409] +1 other test pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][410] ([i915#8411]) -> [SKIP][411] ([i915#2575])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][412] ([i915#8414]) -> [SKIP][413] ([i915#12506])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-3/igt@drm_fdinfo@all-busy-idle-check-all.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          [SKIP][414] ([i915#12506]) -> [SKIP][415] ([i915#8414]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [INCOMPLETE][417] ([i915#7297])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#8555])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][420] ([i915#12543] / [i915#5784]) -> [SKIP][421] ([i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-7/igt@gem_eio@reset-stress.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#4771])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#4812])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          [SKIP][426] ([i915#8555]) -> [SKIP][427] ([i915#2575])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          [SKIP][428] ([i915#4812]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-1/igt@gem_exec_fence@submit.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#3539])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          [SKIP][432] ([i915#3539] / [i915#4852]) -> [SKIP][433] ([i915#2575]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-3/igt@gem_exec_flush@basic-wb-pro-default.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][434] ([i915#3281]) -> [SKIP][435] ([i915#2575]) +8 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-read.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#3281]) +6 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15733/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg2:          [SKIP][438] ([i915

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12181/index.html
