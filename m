Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF371E66894
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 09:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262210E13C;
	Sun, 24 Nov 2024 09:10:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6C10E0CB;
 Sun, 24 Nov 2024 09:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?capture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 09:10:21 -0000
Message-ID: <173243942113.2402556.2693703133685486013@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120233215.1637981-1-zhanjun.dong@intel.com>
In-Reply-To: <20241120233215.1637981-1-zhanjun.dong@intel.com>
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

Series: tests/intel/xe_exec_capture: Add xe_exec_capture test (rev3)
URL   : https://patchwork.freedesktop.org/series/140007/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15725_full -> IGTPW_12154_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12154_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12154_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12154_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][8] +2 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][9] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-rkl:          [PASS][10] -> [DMESG-WARN][11] +49 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][12] +8 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_vblank@query-forked@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][13] +7 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_vblank@query-forked@pipe-a-hdmi-a-2.html

  
#### Warnings ####

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][14] ([i915#4270]) -> [TIMEOUT][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][16] ([i915#12964]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [ABORT][18] -> [DMESG-WARN][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-2/igt@i915_module_load@reload-no-display.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-4/igt@i915_module_load@reload-no-display.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [SKIP][20] -> [INCOMPLETE][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          [SKIP][22] ([i915#2575]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         [SKIP][24] ([i915#6524]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          [FAIL][26] ([i915#4349]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-1/igt@perf_pmu@busy-double-start.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][28] +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15725_full and IGTPW_12154_full:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  

Known issues
------------

  Here are the changes found in IGTPW_12154_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8411])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8411])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#6230])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#6230])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#11078])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8414]) +21 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#8414]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#2582])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [PASS][37] -> [SKIP][38] ([i915#2582])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-6/igt@fbdev@unaligned-write.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3936])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3555] / [i915#9323])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#9323])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#7697])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#6335])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#8562])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#8562])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-8/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [PASS][48] -> [SKIP][49] ([i915#2575]) +107 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@gem_ctx_exec@basic-nohangcheck.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [PASS][50] -> [DMESG-WARN][51] ([i915#12901]) +1 other test dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#1099])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb1/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#8555]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][54] ([i915#11980] / [i915#12580])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#280])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#280])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#280])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][58] ([i915#10030] / [i915#7975] / [i915#8213])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4771])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4812]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4036])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3539] / [i915#4852]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3281]) +14 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3281]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3281]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4537] / [i915#4812])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4860]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4860])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([i915#4613]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [PASS][72] -> [SKIP][73] ([i915#12936]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#12936])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#4613])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][77] ([i915#5493]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4613]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#12193]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4565]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#284])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4077]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4083]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_pread@bench:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3282]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@gem_pread@bench.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3282]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3282])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][88] ([i915#2658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4270])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#12975])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][91] ([i915#12917]) +1 other test timeout
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4270]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-tglu:         [PASS][93] -> [SKIP][94] ([i915#4270]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-10/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#4270])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][96] +294 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#5190] / [i915#8428]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4885]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4885])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4077]) +16 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3297] / [i915#3323])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3297] / [i915#4880])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#3297] / [i915#4880]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3297]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][109] +38 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#2527]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#2527] / [i915#2856]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4881])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload:
    - shard-dg2:          NOTRUN -> [FAIL][115] ([i915#12870])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][116] -> [ABORT][117] ([i915#9820])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [PASS][118] -> [ABORT][119] ([i915#9820])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#8399])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][121] -> [FAIL][122] ([i915#12548] / [i915#3591]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#11681] / [i915#6621])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11681] / [i915#6621])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#11681])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#4387])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#6188])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5723])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4212]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#9531])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][132] ([i915#1769])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][135] ([i915#12964]) +1 other test dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#5286]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5286]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#5286]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#5286])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][142] -> [SKIP][143] +17 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#5190]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4538] / [i915#5190]) +9 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][147] +10 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#6095]) +102 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +64 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#12313])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#6095]) +150 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12805])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#12805])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#12313])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#6095]) +29 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12313]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#6095]) +76 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3742])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +7 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#7828]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7828]) +14 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7828]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#7828]) +8 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3555] / [i915#9979])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3116] / [i915#3299]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3299])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6944] / [i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#7118])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#7116])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@kms_content_protection@type1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#12976])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#3555]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3555]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [PASS][185] -> [DMESG-WARN][186] ([i915#12917])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2575]) +73 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3555]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#12976])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#12976]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-rkl:          [PASS][191] -> [DMESG-WARN][192] ([i915#12964]) +1 other test dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#4103] / [i915#4213]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#4103])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][195] ([i915#2346])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][196] -> [FAIL][197] ([i915#2346])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#9067])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#4103])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#9723])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3840] / [i915#9053])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3469])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3469])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#1839])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3637]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#3637])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9934]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9934]) +13 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-snb:          [PASS][218] -> [FAIL][219] ([i915#2122]) +13 other tests fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg1:          NOTRUN -> [FAIL][220] ([i915#12517] / [i915#12840] / [i915#2122])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:
    - shard-dg1:          NOTRUN -> [FAIL][221] ([i915#2122]) +1 other test fail
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-dg2:          NOTRUN -> [FAIL][222] ([i915#2122]) +2 other tests fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][223] ([i915#4839] / [i915#6113]) +1 other test incomplete
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [PASS][224] -> [FAIL][225] ([i915#11989] / [i915#2122])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][226] ([i915#11989])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][227] ([i915#2122])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
    - shard-tglu-1:       NOTRUN -> [FAIL][228] ([i915#2122]) +4 other tests fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#2672]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672]) +6 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#2672]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#5274])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][241] -> [FAIL][242] ([i915#6880])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-snb:          [PASS][243] -> [SKIP][244] +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#5354]) +26 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1825]) +8 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][247] +67 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#8708]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5439]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3458]) +14 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] +34 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#9766])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#8708]) +26 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3023]) +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][255] +101 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3458]) +26 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#12388])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#12394])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#12339])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#6301]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#6301])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#6301])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#6301])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][267] ([i915#12178])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][268] ([i915#7862]) +1 other test fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][269] ([i915#12177])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][270] ([i915#10647]) +1 other test fail
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk6/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3555])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#12247] / [i915#9423])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#12247]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#12247]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12247] / [i915#6953] / [i915#9423])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#12247] / [i915#6953])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12247] / [i915#6953])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#12247]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#12247]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [PASS][282] -> [SKIP][283] ([i915#2575] / [i915#9423]) +4 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#12247] / [i915#3555] / [i915#9423])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][285] +68 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb7/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9812]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-9/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#5354])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#5354]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9685]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3828])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#5978])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][292] ([i915#9295])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][293] -> [SKIP][294] ([i915#9340])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#8430])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [PASS][296] -> [SKIP][297] ([i915#12937])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-4/igt@kms_pm_rpm@cursor.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][298] -> [SKIP][299] ([i915#9519])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9519])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#9519])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9519])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#9519]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([Intel XE#3529])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][305] ([i915#11520]) +10 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#11520]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#11520]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#11520]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#11520]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
    - shard-snb:          NOTRUN -> [SKIP][310] ([i915#11520])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#11520]) +11 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#9732]) +6 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9732]) +27 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#1072] / [i915#9732]) +16 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@kms_psr@psr2-primary-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#1072] / [i915#9732]) +9 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +26 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#9685])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#5289]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#5289])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#8623]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][322] ([i915#10959])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9906]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#3555] / [i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#9906])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#9906])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#9906])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#2437])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][330] ([i915#2437]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#2437])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#2437] / [i915#9412])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#2437]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#2436])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@oa-exponents:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12506])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@perf@oa-exponents.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#2433])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg2:          [PASS][337] -> [FAIL][338] ([i915#4349]) +5 other tests fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-7/igt@perf_pmu@busy-idle@vcs0.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@perf_pmu@busy-idle@vcs0.html
    - shard-dg1:          [PASS][339] -> [FAIL][340] ([i915#4349]) +3 other tests fail
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-13/igt@perf_pmu@busy-idle@vcs0.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#8850])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-14/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@interrupts:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#12506]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-7/igt@perf_pmu@interrupts.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#8516])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#3708]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#3291] / [i915#3708])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#3291] / [i915#3708])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#3708] / [i915#4077])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-8/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#3708] / [i915#4077])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#9917])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#9917])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][352] ([i915#12910]) +19 other tests fail
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#9917])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-tglu-1:       NOTRUN -> [FAIL][354] ([i915#12910])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][355] ([i915#12564] / [i915#9781])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-7/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][356] -> [FAIL][357] ([i915#12875])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@tools_test@tools_test.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [FAIL][358] ([i915#12869]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@core_getversion@all-cards.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-3/igt@core_getversion@all-cards.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][360] ([i915#2582]) -> [PASS][361] +2 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@fbdev@eof.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@fbdev@eof.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][362] ([i915#7297]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-3/igt@gem_ccs@suspend-resume.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][364] ([i915#12392] / [i915#7297]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-3/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][366] ([i915#12714] / [i915#5784]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fence@syncobj-repeat:
    - shard-rkl:          [DMESG-WARN][368] -> [PASS][369] +2 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@gem_exec_fence@syncobj-repeat.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@gem_exec_fence@syncobj-repeat.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg2:          [SKIP][370] ([i915#12936]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [PASS][373] +112 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_ppgtt@shrink-vs-evict-pinned.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][374] -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-rkl:          [SKIP][376] ([i915#12964]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@i915_pm_rpm@sysfs-read.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-3/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          [SKIP][378] -> [PASS][379] +17 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][380] ([i915#2346]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [FAIL][382] ([i915#2122]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-glk:          [FAIL][384] ([i915#2122]) -> [PASS][385] +3 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-glk5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-glk2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][386] ([i915#2122]) -> [PASS][387] +11 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-tglu:         [FAIL][388] ([i915#2122]) -> [PASS][389] +9 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-10/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-tglu:         [FAIL][390] ([i915#10826]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][392] -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][394] -> [PASS][395] +7 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][396] ([i915#12964]) -> [PASS][397] +55 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][398] ([i915#2575] / [i915#9423]) -> [PASS][399] +2 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][400] ([i915#12964] / [i915#9519]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][402] ([i915#12937]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][404] ([i915#9519]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          [SKIP][406] ([i915#9519]) -> [PASS][407] +2 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [DMESG-WARN][408] ([i915#12917]) -> [PASS][409] +1 other test pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@kms_vblank@query-forked-hang.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-1/igt@kms_vblank@query-forked-hang.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-rkl:          [FAIL][410] ([i915#10538]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          [SKIP][412] ([i915#12506]) -> [PASS][413] +3 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@perf_pmu@enable-race.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][414] -> [PASS][415] +2 other tests pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-tglu-4/igt@perf_pmu@module-unload.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-tglu-6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [SKIP][416] -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-gt0.html

  * igt@sw_sync@timeline_closed:
    - shard-dg1:          [INCOMPLETE][418] -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg1-17/igt@sw_sync@timeline_closed.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg1-18/igt@sw_sync@timeline_closed.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [SKIP][420] -> [ABORT][421] ([i915#5507])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][422] ([i915#12506]) -> [SKIP][423] ([i915#8414]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          [SKIP][424] ([i915#8414]) -> [SKIP][425] ([i915#12506])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-7/igt@drm_fdinfo@virtual-busy-hang-all.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          [SKIP][426] ([i915#8555]) -> [SKIP][427] ([i915#2575]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#280])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#4771])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_capture@capture:
    - shard-dg2:          [FAIL][432] ([i915#11965] / [i915#12558]) -> [SKIP][433] ([i915#2575])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_exec_capture@capture.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_exec_capture@capture.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#4812])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_fence@concurrent.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-1/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          [SKIP][436] ([i915#3539] / [i915#4852]) -> [SKIP][437] ([i915#2575]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-3/igt@gem_exec_flush@basic-uc-rw-default.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#3539])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-2/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#3539] / [i915#4852])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-6/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#3281]) +4 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][444] ([i915#3281]) -> [SKIP][445] ([i915#2575]) +8 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#4537] / [i915#4812])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][448] ([i915#4537] / [i915#4812]) -> [SKIP][449] ([i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-8/igt@gem_exec_schedule@reorder-wide.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          [SKIP][450] ([i915#4860]) -> [SKIP][451] ([i915#2575])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15725/shard-dg2-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
   [451]: https://intel-gfx-ci.01.org/tree/d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12154/index.html
