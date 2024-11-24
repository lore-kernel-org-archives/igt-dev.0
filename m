Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A009E6780A
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 20:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CB710E093;
	Sun, 24 Nov 2024 20:32:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E913610E023;
 Sun, 24 Nov 2024 20:32:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fmmap=3A?=
 =?utf-8?q?_fix_assert=5Fcaching_on_small-bar?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 20:32:15 -0000
Message-ID: <173248033595.2570888.7980536342800332664@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122164730.326543-1-matthew.auld@intel.com>
In-Reply-To: <20241122164730.326543-1-matthew.auld@intel.com>
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

Series: tests/intel/xe_mmap: fix assert_caching on small-bar
URL   : https://patchwork.freedesktop.org/series/141710/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15732_full -> IGTPW_12180_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12180_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12180_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [PASS][7] -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-5/igt@i915_pm_rpm@gem-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][9] -> [DMESG-FAIL][10] +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-rkl:          [PASS][11] -> [DMESG-WARN][12] +56 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][13] +8 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][14] +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_plane@pixel-format:
    - shard-dg1:          [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-18/igt@kms_plane@pixel-format.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_plane@pixel-format.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [SKIP][17] ([i915#11078]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@device_reset@cold-reset-bound.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][19] ([i915#12917]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][21] ([i915#2575]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][23] ([i915#9100]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@perf@non-zero-reason.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          [FAIL][25] ([i915#4349]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@perf_pmu@busy-double-start.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-rkl:          [FAIL][27] ([i915#4349]) -> [DMESG-WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-plain-flip:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-9/igt@kms_flip@2x-plain-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_12180_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-dg2:          [PASS][30] -> [SKIP][31] +23 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@api_intel_allocator@two-level-inception-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#8411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#6230])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-dg1:          [PASS][35] -> [DMESG-WARN][36] ([i915#4423])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@debugfs_test@basic-hwmon.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#11078])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#11078])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8414]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#7697])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#7697])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][43] ([i915#12353])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_param@invalid-param-set:
    - shard-dg2:          [PASS][44] -> [SKIP][45] ([i915#2575]) +137 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_ctx_param@invalid-param-set.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#8555])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][47] ([i915#11980] / [i915#12580])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][48] ([i915#11980] / [i915#12580])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][49] ([i915#11980] / [i915#12580])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][50] ([i915#1099])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb4/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][51] ([i915#11980] / [i915#12580])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#280]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#280]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#280])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4771])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][57] ([i915#11965] / [i915#12558]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][58] ([i915#11965]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][59] ([i915#3778] / [i915#7016])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3539])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3539] / [i915#4852]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539] / [i915#4852]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3281]) +16 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3281]) +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3281]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4537] / [i915#4812]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#7276])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4812]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4860]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4860]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#12936])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg2:          [PASS][73] -> [SKIP][74] ([i915#12936])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4565]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][76] ([i915#4613]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-glk5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#12193]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4613]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][80] ([i915#5493]) +1 other test timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][81] ([i915#5493]) +1 other test timeout
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#4613]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4083]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          [PASS][84] -> [DMESG-WARN][85] ([i915#12917])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@gem_mmap_gtt@medium-copy-odd.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3282]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3282]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][90] ([i915#12917])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#12975])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4270]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-tglu:         [PASS][94] -> [SKIP][95] ([i915#4270])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2575] / [i915#5190]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#5190] / [i915#8428]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4079]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [PASS][99] -> [DMESG-FAIL][100] ([i915#12964])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-4/igt@gem_softpin@noreloc-s3.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4077]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4077]) +16 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#3297] / [i915#3323])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#3297]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3282] / [i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3282] / [i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3297] / [i915#4958])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#3297]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2856]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#2527]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#2527]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][118] -> [ABORT][119] ([i915#9820])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [PASS][120] -> [ABORT][121] ([i915#9820])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][122] ([i915#12817] / [i915#9820])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#8399]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][124] ([i915#12548] / [i915#3591]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#11681] / [i915#6621]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#11681])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#6188])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][128] -> [FAIL][129] ([i915#12867]) +4 other tests fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@i915_selftest@perf.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#7707])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4212]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4212]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#8709]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#6228])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5286]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5286])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5286]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3638]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5190]) +9 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#12313]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#12313]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#6095]) +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +104 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#12313])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +133 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#6095]) +13 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#12313]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#6095]) +74 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][156] +119 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#6095]) +192 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3742])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3742]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7828]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7828]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#7828]) +9 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#7828])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#7828]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][166] +86 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb6/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#7118] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#7118] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7116] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3299])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#3116] / [i915#3299])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#9433])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7118])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#7116])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#6944] / [i915#7116] / [i915#7118])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#12976]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#12976]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3555])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#12976])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3555]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#12976])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#4103] / [i915#4213]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#4103]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9723])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3804])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#1257])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#1257])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#1257])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#1257])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#12402])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#12402])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          [PASS][197] -> [DMESG-WARN][198] ([i915#12964]) +4 other tests dmesg-warn
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-1/igt@kms_draw_crc@draw-method-pwrite.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3840] / [i915#9688])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#3840])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3840] / [i915#9053])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3840] / [i915#9053])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3840] / [i915#9053])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3469]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-5/igt@kms_fbcon_fbt@psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3469])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3955])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3469])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#4854])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#4854])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#1839])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#9337])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#658]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#658])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#3637]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#9934]) +10 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#8381]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#9934]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [FAIL][226] ([i915#2122]) +3 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-rkl:          [PASS][227] -> [FAIL][228] ([i915#2122])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [FAIL][229] ([i915#12517] / [i915#2122])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-tglu:         NOTRUN -> [FAIL][230] ([i915#2122]) +2 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
    - shard-rkl:          [PASS][231] -> [FAIL][232] ([i915#11989]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#2122]) +1 other test fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4:
    - shard-dg1:          NOTRUN -> [FAIL][235] ([i915#2122]) +2 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a4.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#8381])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#2575]) +69 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672] / [i915#3555])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672]) +5 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#1825]) +12 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-snb:          [PASS][250] -> [SKIP][251] +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#5354]) +23 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][253] +49 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#5439])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#10433] / [i915#3458])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#8708]) +23 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#8708]) +15 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9766])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#3458]) +9 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3458]) +22 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][261] +100 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][262] +38 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#3023]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8228]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#12713])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#3555] / [i915#8228])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#10656])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#12339])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#6301])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#6301]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] +35 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#8821])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][275] ([i915#8292]) +1 other test fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12247] / [i915#9423])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#12247]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#12247]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#12247]) +9 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2:          [PASS][280] -> [SKIP][281] ([i915#2575] / [i915#9423]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#2575] / [i915#9423]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#12247]) +17 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#12247] / [i915#6953])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#12247] / [i915#6953])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#12247]) +17 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#3555])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247] / [i915#3555])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#12247] / [i915#3555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#4423] / [i915#5354])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#9812])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-10/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#5354]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#5354])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#3828])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2:          [PASS][295] -> [SKIP][296] ([i915#12937])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@kms_pm_rpm@basic-rte.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#9519])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#9519]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9519])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#12937])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][302] -> [SKIP][303] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9519])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#6524])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#11520])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#11520]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#11520])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][309] ([i915#11520])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-glk8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#11520]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#11520]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#11520]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#9683])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#9683]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9683])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-4/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-pr-primary-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9732]) +30 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@kms_psr@fbc-pr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#1072] / [i915#9732]) +35 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#9732]) +10 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#1072] / [i915#9732]) +20 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9685]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#5289])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#5190]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12755]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#3555]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][326] ([IGT#2])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][327] ([IGT#2] / [i915#6493])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#8623]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#8623])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#11920])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#11920])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#9906]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [PASS][333] -> [SKIP][334] ([i915#3555] / [i915#9906])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_vrr@negative-basic.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#3555] / [i915#9906])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#9906]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#9906])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#9906]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#9906]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#2437] / [i915#9412])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][341] ([i915#2437])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-glk8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#2437] / [i915#9412])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#7387])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-8/igt@perf@global-sseu-config.html

  * igt@perf@oa-exponents:
    - shard-dg2:          [PASS][344] -> [SKIP][345] ([i915#12506]) +6 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@perf@oa-exponents.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf@oa-exponents.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#12506]) +4 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][347] ([i915#11823])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][348] -> [FAIL][349] ([i915#4349]) +6 other tests fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [PASS][350] -> [FAIL][351] ([i915#4349]) +5 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][352] ([i915#9351])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][353] ([i915#9351])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#3708]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#3291] / [i915#3708])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#9917]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][357] ([i915#12910]) +9 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-9/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#9917])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][359] ([i915#12817] / [i915#5507]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@device_reset@unbind-reset-rebind.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@write:
    - shard-dg2:          [SKIP][361] ([i915#2582]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@fbdev@write.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@fbdev@write.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][363] ([i915#7975] / [i915#8213]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [SKIP][365] ([i915#12936]) -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][367] -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@gem_workarounds@suspend-resume-context.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][369] ([i915#12964]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         [FAIL][371] ([i915#11808]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][373] ([i915#2346]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][375] ([i915#2346]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][377] ([i915#12917]) -> [PASS][378] +2 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-tglu:         [FAIL][379] ([i915#12431]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][381] -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-8/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [DMESG-WARN][383] ([i915#12964]) -> [PASS][384] +9 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@kms_flip@flip-vs-panning-interruptible.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          [INCOMPLETE][385] -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@kms_flip@plain-flip-fb-recreate.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-dg1:          [FAIL][387] ([i915#12517] / [i915#12996] / [i915#2122]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][389] ([i915#2122]) -> [PASS][390] +9 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][391] -> [PASS][392] +23 other tests pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][393] ([i915#6880]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][395] -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          [SKIP][397] -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_hdmi_inject@inject-audio.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-14/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg1:          [INCOMPLETE][399] ([i915#12756]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-12/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][401] ([i915#2575] / [i915#9423]) -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][403] ([i915#12937]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][405] ([i915#9519]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@query-busy:
    - shard-dg1:          [DMESG-WARN][407] ([i915#4423]) -> [PASS][408] +2 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_vblank@query-busy.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg1-13/igt@kms_vblank@query-busy.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][409] ([i915#10538]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@perf@blocking@0-rcs0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-tglu-3/igt@perf@blocking@0-rcs0.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][411] ([i915#12506]) -> [PASS][412] +6 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@busy-accuracy-50:
    - shard-rkl:          [DMESG-WARN][413] -> [PASS][414] +60 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@perf_pmu@busy-accuracy-50.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-1/igt@perf_pmu@busy-accuracy-50.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][415] ([i915#4349]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [SKIP][417] ([i915#2575]) -> [PASS][418] +110 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  
#### Warnings ####

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][419] ([i915#8414]) -> [SKIP][420] ([i915#12506]) +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][421] ([i915#2575]) -> [SKIP][422] ([i915#280])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          [SKIP][423] ([i915#280]) -> [SKIP][424] ([i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-2/igt@gem_ctx_sseu@invalid-args.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#4771])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [SKIP][428] ([i915#4812])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][429] ([i915#4036]) -> [SKIP][430] ([i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          [SKIP][431] ([i915#2575]) -> [TIMEOUT][432] ([i915#3778] / [i915#7016])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_endless@dispatch.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-3/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][433] ([i915#4812]) -> [SKIP][434] ([i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@gem_exec_fence@concurrent.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          [SKIP][435] ([i915#2575]) -> [SKIP][436] ([i915#3539] / [i915#4852])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          [SKIP][437] ([i915#3281]) -> [SKIP][438] ([i915#2575]) +5 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_exec_reloc@basic-active.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][439] ([i915#2575]) -> [SKIP][440] ([i915#3281]) +7 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][441] ([i915#4537] / [i915#4812]) -> [SKIP][442] ([i915#2575]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          [SKIP][443] ([i915#4860]) -> [SKIP][444] ([i915#2575])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-none.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [SKIP][446] ([i915#4077]) +5 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_gtt@bad-object.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-2/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          [SKIP][447] ([i915#4077]) -> [SKIP][448] ([i915#2575]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          [SKIP][449] ([i915#2575]) -> [SKIP][450] ([i915#4083]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_wc@coherency.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/shard-dg2-4/igt@gem_mmap_wc@coherency.h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12180/index.html
