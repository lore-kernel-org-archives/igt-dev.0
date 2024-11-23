Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB2CE6688E
	for <igt-dev@archiver.kernel.org>; Sat, 23 Nov 2024 23:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2036210E48E;
	Sat, 23 Nov 2024 23:06:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B910E287;
 Sat, 23 Nov 2024 23:06:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_runner=3A_Allow_limits_a?=
 =?utf-8?q?t_dumping_dmesg_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Nov 2024 23:06:52 -0000
Message-ID: <173240321217.2246350.4353490959493116864@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
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

Series: runner: Allow limits at dumping dmesg (rev2)
URL   : https://patchwork.freedesktop.org/series/140182/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15724_full -> IGTPW_12151_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12151_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12151_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12151_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ctx_engines@execute-one:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@gem_ctx_engines@execute-one.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-5/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-rkl:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@i915_pm_rpm@gem-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][11] -> [DMESG-FAIL][12] +3 other tests dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][13] +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
    - shard-rkl:          [PASS][14] -> [DMESG-WARN][15] +32 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [SKIP][16] ([i915#11078]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@device_reset@cold-reset-bound.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [SKIP][18] ([i915#4270]) -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][20] ([i915#12917]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [FAIL][22] ([i915#12941]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][24] ([i915#12941]) -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-2/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          [SKIP][26] ([i915#5354]) -> [SKIP][27] +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][28] ([i915#2575]) -> [SKIP][29] +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          [SKIP][30] ([i915#1072] / [i915#9732]) -> [INCOMPLETE][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@kms_psr@psr2-sprite-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@kms_psr@psr2-sprite-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][32] +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15724_full and IGTPW_12151_full:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  

Known issues
------------

  Here are the changes found in IGTPW_12151_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6230])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-5/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#6230])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#6230])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#9318])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-1/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8414]) +32 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8414]) +23 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][40] -> [SKIP][41] ([i915#2582])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@fbdev@eof.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@fbdev@eof.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#9323])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][46] -> [INCOMPLETE][47] ([i915#7297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#7697])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#6335])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#8562])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][51] ([i915#1099]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#8555])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu-1:       NOTRUN -> [FAIL][53] ([i915#11980] / [i915#12580])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#5882]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#280])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][56] ([i915#5784])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4771]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#6344])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4812]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4812])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3539] / [i915#4852]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3539])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3539] / [i915#4852])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3281]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3281]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3281]) +12 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4537] / [i915#4812])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][68] ([i915#7975] / [i915#8213])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4860]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4860]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613] / [i915#7582])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#4613])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-glk5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#12936]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4565]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#12193]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][78] ([i915#5493])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][79] ([i915#5493]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [PASS][80] -> [SKIP][81] ([i915#12936])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@gem_lmem_swapping@verify-ccs.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#4613]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077]) +13 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4083]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4083]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3282]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3282]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][90] ([i915#2658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][91] ([i915#12917]) +1 other test timeout
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4270])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4270]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#2575] / [i915#5190]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190] / [i915#8428]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4885]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4079])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4879])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297] / [i915#4880]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297] / [i915#4880])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-physical:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#12961])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_watchdog@default-physical.html

  * igt@gem_watchdog@default-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#12961])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@gem_watchdog@default-virtual.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#2527]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#2856]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#2527])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#2527] / [i915#2856]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4881])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@i915_fb_tiling.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#7178])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#6412])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#8399])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#8399])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][118] +11 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4387])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][121] -> [FAIL][122] ([i915#12867]) +4 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@i915_selftest@perf.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          [PASS][124] -> [SKIP][125] ([i915#2575] / [i915#5190])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4215])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4212]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#8709]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#9531])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#1769] / [i915#3555])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][131] ([i915#5956])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#5286]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#5286]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#5286]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5286]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#5286]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3638])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3638]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#5190]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][140] +102 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5190]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6095]) +140 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] +51 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#6095]) +126 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#12313]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][148] -> [SKIP][149] +21 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#12805]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#6095]) +84 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#6095]) +24 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#6095]) +42 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][157] +58 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-glk5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#12313])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#10434] / [i915#6095])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3742]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#11616] / [i915#7213])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3742])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7213]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4087]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#7828]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +8 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7828]) +13 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7828]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#7828]) +14 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3299]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3299]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3116] / [i915#3299]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6944] / [i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-5/igt@kms_content_protection@lic-type-1.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][176] ([i915#8816])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb2/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#7116])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#7116] / [i915#9424]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3555]) +10 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#12976])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#12976]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#12976])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#12976]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#5354]) +27 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#9067])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#4103] / [i915#4213])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3555]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#1257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3840])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#3840] / [i915#9053])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3469])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3469])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#4854])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_feature_discovery@chamelium.html
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#2065] / [i915#4854])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4881])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3637]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#3637])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#8381]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#9934]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][204] -> [FAIL][205] ([i915#2122]) +5 other tests fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9934]) +12 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8381]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [PASS][208] -> [FAIL][209] ([i915#2122]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#2672]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#2672] / [i915#3555])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#2587] / [i915#2672]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2587] / [i915#2672]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#5274])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][222] -> [FAIL][223] ([i915#6880])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [PASS][224] -> [DMESG-WARN][225] ([i915#12964]) +2 other tests dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][226] +63 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#1825]) +6 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3458]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] +24 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8708]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3458]) +25 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#5439])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#9766])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#3023]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8708]) +29 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8228])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][241] -> [SKIP][242] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@kms_hdr@static-swap.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#12339]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#12388])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#12339]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@multimaster-lease:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2575]) +85 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_lease@multimaster-lease.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#6301]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#6301])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#6301])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8821])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#12247]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#12247] / [i915#6953]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#12247] / [i915#9423])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#12247]) +15 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#12247]) +9 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#12247] / [i915#6953] / [i915#9423])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#12247] / [i915#6953]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#12247]) +12 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][259] -> [SKIP][260] ([i915#2575] / [i915#9423]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#2575] / [i915#9423]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#12247]) +7 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#12343])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][264] +72 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb5/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#9812])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#5354])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#9685])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9685])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8430])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#12937])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9519])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#9519])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#9519]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#9519])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][275] -> [SKIP][276] ([i915#9519]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#11520]) +9 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#11520]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#11520]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][280] ([i915#11520])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-glk5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#11520]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-snb:          NOTRUN -> [SKIP][282] ([i915#11520])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#11520]) +12 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#9683])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#1072] / [i915#9732]) +20 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#9732]) +10 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#1072] / [i915#9732]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9732]) +28 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#9732]) +37 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#12755]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#5289])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#12755] / [i915#5190]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#5289])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#3555]) +7 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][295] ([i915#12231]) +1 other test abort
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][296] -> [FAIL][297] ([i915#5465]) +2 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@kms_setmode@basic.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#3555]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#8623])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-idle-hang:
    - shard-dg2:          [PASS][300] -> [SKIP][301] ([i915#2575]) +150 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_vblank@ts-continuation-idle-hang.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@kms_vblank@ts-continuation-idle-hang.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#9906])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#9906]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-14/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9906]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#3555] / [i915#9906])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#9906]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#9906]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#2437])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#2437] / [i915#9412])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][310] ([i915#2437])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-glk5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#2437] / [i915#9412]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#2437]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-dg2:          [PASS][313] -> [SKIP][314] ([i915#12506]) +10 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#12506]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#2434])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@perf@mi-rpc.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#2434])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#2434])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#2435])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#2433])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][321] -> [FAIL][322] ([i915#4349]) +1 other test fail
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#8516])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#8516])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#8516])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#8516])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#3708] / [i915#4077])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#3291] / [i915#3708])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@prime_vgem@basic-read.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#3708])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-18/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#9917]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#9917])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#9917]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][333] ([i915#12910]) +19 other tests fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [FAIL][334] ([i915#12869]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@core_getversion@all-cards.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@core_getversion@all-cards.html

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][336] ([i915#12866]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@core_getversion@basic.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@core_getversion@basic.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][338] ([i915#12817] / [i915#5507]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][340] ([i915#12543] / [i915#5784]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-14/igt@gem_eio@reset-stress.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [FAIL][342] ([i915#12714] / [i915#5784]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@gem_eio@unwedge-stress.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gem_eio@unwedge-stress.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][344] ([i915#12936]) -> [PASS][345] +2 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - {shard-dg2-9}:      [SKIP][346] ([i915#12936]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-9/igt@gem_lmem_swapping@verify-random-ccs.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         [SKIP][348] ([i915#4270]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-9/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][350] ([i915#12548] / [i915#3591]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [FAIL][352] ([i915#12739] / [i915#3591]) -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2:          [FAIL][356] ([i915#10991] / [i915#12766]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-dg2:          [FAIL][358] ([i915#12518]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [FAIL][360] ([i915#5956]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-snb:          [SKIP][362] -> [PASS][363] +7 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][364] ([i915#3555]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][366] ([i915#12917]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-1/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][368] ([i915#2122]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-dg1:          [FAIL][370] ([i915#12517] / [i915#2122]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:
    - shard-dg1:          [FAIL][372] ([i915#12517]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][374] ([i915#2122]) -> [PASS][375] +5 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-tglu:         [FAIL][376] ([i915#2122]) -> [PASS][377] +4 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [FAIL][378] ([i915#2122]) -> [PASS][379] +4 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][380] -> [PASS][381] +15 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][382] ([i915#12964]) -> [PASS][383] +31 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [SKIP][384] ([i915#2575] / [i915#9423]) -> [PASS][385] +3 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][386] ([i915#9295]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][388] ([i915#9519]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][390] ([i915#12937]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][392] ([i915#2575]) -> [PASS][393] +118 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@kms_vblank@ts-continuation-modeset.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][394] ([i915#10538] / [i915#12664]) -> [PASS][395] +1 other test pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@perf@blocking@0-rcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-4/igt@perf@blocking@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][396] ([i915#12506]) -> [PASS][397] +4 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][398] -> [PASS][399] +2 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-10/igt@perf_pmu@module-unload.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-tglu-7/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#8411])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][402] ([i915#12506]) -> [SKIP][403] ([i915#8414]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][404] ([i915#8414]) -> [SKIP][405] ([i915#12506]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@drm_fdinfo@virtual-busy-hang.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#7697])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#8562])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [INCOMPLETE][410] ([i915#12353]) -> [SKIP][411] ([i915#2575])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][412] ([i915#8555]) -> [SKIP][413] ([i915#2575])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [FAIL][415] ([i915#11980] / [i915#12580])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#280])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#4771])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][420] ([i915#4812]) -> [SKIP][421] ([i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@gem_exec_balancer@bonded-semaphore.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][422] ([i915#4771]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#4812])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@hog.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][426] ([i915#4036]) -> [SKIP][427] ([i915#2575])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][428] ([i915#3539]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          [SKIP][430] ([i915#3539] / [i915#4852]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_exec_flush@basic-wb-pro-default.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#3539] / [i915#4852])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-10/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          [SKIP][434] -> [SKIP][435] ([i915#2575]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#3281]) +3 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-dg2:          [SKIP][438] ([i915#3281]) -> [SKIP][439] ([i915#2575]) +3 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-read-noreloc.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [INCOMPLETE][440] -> [ABORT][441] ([i915#7975] / [i915#8213])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#4860]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2:          [SKIP][444] ([i915#12936]) -> [TIMEOUT][445] ([i915#5493])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-7/igt@gem_lmem_swapping@smem-oom.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#4077]) +4 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_gtt@big-copy.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-1/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          [SKIP][448] ([i915#2575]) -> [SKIP][449] ([i915#4083]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/shard-dg2-3/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          [SKIP][450] ([i915#4083]) -> [S

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12151/index.html
