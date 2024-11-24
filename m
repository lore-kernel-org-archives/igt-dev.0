Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7705DD75E34
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 19:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E8510E2C2;
	Sun, 24 Nov 2024 19:59:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173E610E2C2;
 Sun, 24 Nov 2024 19:59:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Feudebug?=
 =?utf-8?q?=5Fonline=3A_Introduce_read/write_pagefault_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 19:59:54 -0000
Message-ID: <173247839410.2563381.14234625265246364883@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
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

Series: tests/intel/xe_eudebug_online: Introduce read/write pagefault tests (rev3)
URL   : https://patchwork.freedesktop.org/series/141401/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15732_full -> IGTPW_12177_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12177_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12177_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12177_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_mm@drm_mm:
    - shard-rkl:          [PASS][1] -> [DMESG-WARN][2] +52 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@drm_mm@drm_mm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@drm_mm@drm_mm.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [PASS][4] -> [SKIP][5] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-5/igt@i915_pm_rpm@gem-idle.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@sysfs_preempt_timeout@timeout:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][8] +7 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@sysfs_preempt_timeout@timeout.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][9] ([i915#12917]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][11] ([i915#2575]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          [SKIP][13] ([i915#9766]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][15] ([i915#9100]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@perf@non-zero-reason.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@perf@non-zero-reason.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  
Known issues
------------

  Here are the changes found in IGTPW_12177_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6230])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#11078])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#11078])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8414]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-3/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8414]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][25] -> [SKIP][26] ([i915#1849] / [i915#2582])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@fbdev@info.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@fbdev@info.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [PASS][27] -> [SKIP][28] ([i915#2582])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@fbdev@unaligned-write.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][33] ([i915#7297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [PASS][35] -> [SKIP][36] ([i915#2575]) +162 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg1:          [PASS][37] -> [INCOMPLETE][38] ([i915#12353]) +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@gem_ctx_isolation@preservation-s3.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][41] ([i915#11980] / [i915#12580])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][42] ([i915#11980] / [i915#12580])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][43] ([i915#1099])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb6/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][44] ([i915#11980] / [i915#12580])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4812]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4812]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][50] ([i915#11713])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][51] ([i915#11965] / [i915#12558]) +2 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][52] ([i915#11965]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +16 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3281]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#7276])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [PASS][63] -> [SKIP][64] ([i915#12936]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_lmem_swapping@massive.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#12193]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk8/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4565]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4083]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3282]) +9 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@gem_pxp@create-regular-context-1.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12917])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#4270])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglu:         [PASS][81] -> [SKIP][82] ([i915#4270])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-7/igt@gem_pxp@display-protected-crc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [FAIL][83] ([i915#12940])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4270]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190] / [i915#8428]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#2575] / [i915#5190]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +15 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3282] / [i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3282] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3282] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4958])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4958])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-rkl:          NOTRUN -> [SKIP][97]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#2856]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@gen9_exec_parse@bb-large.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][102] -> [ABORT][103] ([i915#9820])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][104] ([i915#9820])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][105] ([i915#12817] / [i915#9820])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#8399]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][107] ([i915#2681]) +1 other test warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][108] ([i915#12548] / [i915#3591]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#6188])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#5723])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-snb:          [PASS][112] -> [ABORT][113] ([i915#11703])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb2/igt@i915_selftest@mock@sanitycheck.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb4/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][114] -> [FAIL][115] ([i915#12867]) +4 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@i915_selftest@perf.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#6228])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#1769] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#5286]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5286])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#5286])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#5286]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5286]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3638]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5190]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#4538]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#12313]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#12313]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#12313])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10307] / [i915#6095]) +123 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#6095]) +94 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#6095]) +73 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#6095]) +19 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6095]) +136 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#6095]) +19 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#12313]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#11616] / [i915#7213])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3742])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3742]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#7213]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4087]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#7828]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#7828]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#7828]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#7828]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#7828])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][152] +88 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb6/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#9424]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6944] / [i915#7116] / [i915#7118])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3555]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#12976])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#12976])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#12976]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3555]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#12976])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#2575]) +77 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4103] / [i915#4213]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#4103]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-glk:          NOTRUN -> [FAIL][171] ([i915#2346])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][172] ([i915#12638])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#9723])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#9723])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#1257])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1257])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#1257])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#1257])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#12402])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3555] / [i915#3840])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3840] / [i915#9053])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3840] / [i915#9053])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3840] / [i915#9053])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3955])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#3469])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#2065] / [i915#4854])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#4854])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-5/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#4854])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#1839])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#1839])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#1839])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#9337])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#658]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#658])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#658])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3637]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#9934]) +10 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][200] -> [FAIL][201] ([i915#2122]) +11 other tests fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#9934]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-glk:          NOTRUN -> [FAIL][203] ([i915#2122]) +1 other test fail
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk9/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-rkl:          [PASS][204] -> [FAIL][205] ([i915#11989] / [i915#12840] / [i915#2122])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-1/igt@kms_flip@blocking-wf_vblank.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][206] ([i915#2122]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][207] -> [FAIL][208] ([i915#2122]) +7 other tests fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-5/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [PASS][209] -> [FAIL][210] ([i915#11989] / [i915#2122])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
    - shard-dg1:          [PASS][211] -> [FAIL][212] ([i915#11989] / [i915#12517] / [i915#2122])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a4:
    - shard-dg1:          [PASS][213] -> [FAIL][214] ([i915#2122]) +2 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a4.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a4.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#8381]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8381]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-panning@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][217] ([i915#12964]) +2 other tests dmesg-warn
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_flip@flip-vs-panning@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][218] -> [INCOMPLETE][219] ([i915#4839] / [i915#6113])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-dg1:          [PASS][220] -> [INCOMPLETE][221] ([i915#6113])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [PASS][222] -> [FAIL][223] ([i915#2122]) +3 other tests fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:
    - shard-rkl:          [PASS][224] -> [FAIL][225] ([i915#11989])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][226] ([i915#2122]) +7 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [PASS][228] -> [SKIP][229] +26 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672] / [i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#8708]) +11 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-snb:          [PASS][237] -> [SKIP][238] +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#1825]) +12 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][240] +47 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][241] -> [FAIL][242] ([i915#6880]) +1 other test fail
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#8708]) +22 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3458] / [i915#4423])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#4423])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] +17 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3458]) +11 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3458]) +20 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#5354]) +23 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][250] +107 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#3023]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          [PASS][253] -> [SKIP][254] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8228]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3555] / [i915#8228]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#10656]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#12388])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#6301])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#6301]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#8821])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][263] ([i915#8292]) +1 other test fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#12247]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#2575] / [i915#9423])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [PASS][266] -> [SKIP][267] ([i915#2575] / [i915#9423]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][268] +251 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#12247] / [i915#6953])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247]) +17 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12247] / [i915#3555])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#12247] / [i915#3555])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#3555] / [i915#9423])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#12247] / [i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12247]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#12247] / [i915#6953])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#12247]) +36 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#12247]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#5354]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9812]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#5354])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#3828])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#12937]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#12937]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#9519])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9519])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#6524])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#6524]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][292] ([i915#11520])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#11520])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#11520]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][295] ([i915#11520]) +5 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#11520]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#11520])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#11520]) +8 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#9683]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9683])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +8 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9732]) +35 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#9732]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#1072] / [i915#9732]) +29 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#1072] / [i915#9732]) +21 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][306] +51 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12755]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#4235])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][309] -> [DMESG-WARN][310] ([i915#12964]) +7 other tests dmesg-warn
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#5190]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-tglu:         NOTRUN -> [FAIL][312] ([i915#5465]) +2 other tests fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][313] -> [FAIL][314] ([i915#5465]) +2 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#3555]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#8623])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#8623])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#11920])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9906]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-6/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [PASS][320] -> [SKIP][321] ([i915#3555] / [i915#9906])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_vrr@negative-basic.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#3555] / [i915#9906])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9906])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#2437])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-7/igt@kms_writeback@writeback-fb-id.html
    - shard-glk:          NOTRUN -> [SKIP][327] ([i915#2437])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#2437] / [i915#9412])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-10/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#2437] / [i915#9412])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-dg2:          [PASS][330] -> [FAIL][331] ([i915#10538])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#7387])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@perf@global-sseu-config.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#12506]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html

  * igt@perf@oa-exponents:
    - shard-dg2:          [PASS][334] -> [SKIP][335] ([i915#12506]) +10 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@perf@oa-exponents.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@perf@oa-exponents.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [FAIL][336] ([i915#11943])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [FAIL][337] ([i915#11943])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][338] ([i915#9351])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][339] ([i915#9351])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#3708]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#9917])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][342] ([i915#12910]) +19 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][343] ([i915#4423])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-18/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][344] -> [FAIL][345] ([i915#12875])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@tools_test@tools_test.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][346] ([i915#12817] / [i915#5507]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@device_reset@unbind-reset-rebind.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][348] ([i915#2582]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@fbdev@nullptr.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@fbdev@nullptr.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][350] ([i915#12543] / [i915#5784]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-18/igt@gem_eio@reset-stress.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [SKIP][352] ([i915#12936]) -> [PASS][353] +2 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@gem_workarounds@suspend-resume-context.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][356] ([i915#12964]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         [FAIL][358] ([i915#11808]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][360] ([i915#2346]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][362] ([i915#2346]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][364] ([i915#12917]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-tglu:         [FAIL][366] ([i915#12431]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][368] -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-3/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [DMESG-WARN][370] ([i915#12964]) -> [PASS][371] +8 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@kms_flip@flip-vs-panning-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][372] ([i915#2122]) -> [PASS][373] +5 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a4:
    - shard-dg1:          [FAIL][374] ([i915#2122]) -> [PASS][375] +1 other test pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a4.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][376] -> [PASS][377] +22 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][378] ([i915#6880]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          [SKIP][380] -> [PASS][381] +10 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][382] -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][384] ([i915#3555] / [i915#8228]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][386] ([i915#12388]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][388] ([i915#2575] / [i915#9423]) -> [PASS][389] +3 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][390] ([i915#12937]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][392] ([i915#9519]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][394] ([i915#9519]) -> [PASS][395] +1 other test pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [PASS][397] +99 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-4/igt@kms_vblank@ts-continuation-modeset.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][398] ([i915#10538]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@perf@blocking@0-rcs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-tglu-2/igt@perf@blocking@0-rcs0.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][400] ([i915#12506]) -> [PASS][401] +6 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@busy-accuracy-50:
    - shard-rkl:          [DMESG-WARN][402] -> [PASS][403] +59 other tests pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@perf_pmu@busy-accuracy-50.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@perf_pmu@busy-accuracy-50.html

  * igt@syncobj_eventfd@timeline-wait-before-signal:
    - shard-dg1:          [DMESG-WARN][404] ([i915#4423]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@syncobj_eventfd@timeline-wait-before-signal.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg1-13/igt@syncobj_eventfd@timeline-wait-before-signal.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#8411])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][408] ([i915#8414]) -> [SKIP][409] ([i915#12506]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [INCOMPLETE][411] ([i915#7297])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#4771])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-10/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#4812])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          [SKIP][416] ([i915#4812]) -> [SKIP][417] ([i915#2575])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@gem_exec_balancer@hog.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#3539] / [i915#4852]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          [SKIP][420] ([i915#3539] / [i915#4852]) -> [SKIP][421] ([i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#3281]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          [SKIP][424] ([i915#3281]) -> [SKIP][425] ([i915#2575]) +6 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-active.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][426] ([i915#4537] / [i915#4812]) -> [SKIP][427] ([i915#2575]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@gem_exec_schedule@reorder-wide.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg2:          [SKIP][428] ([i915#4860]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#4077]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_gtt@bad-object.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-7/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          [SKIP][432] ([i915#4077]) -> [SKIP][433] ([i915#2575]) +5 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@gem_mmap_gtt@basic-small-bo.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#4083]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_wc@bad-offset.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@read-write:
    - shard-dg2:          [SKIP][436] ([i915#4083]) -> [SKIP][437] ([i915#2575]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@gem_mmap_wc@read-write.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_mmap_wc@read-write.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#3282]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_pwrite@basic-exhaustion.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          [SKIP][440] ([i915#3282]) -> [SKIP][441] ([i915#2575]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_pwrite@basic-random.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          [SKIP][442] ([i915#4270]) -> [SKIP][443] ([i915#2575]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@gem_pxp@create-regular-context-2.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#4270]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-1/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          [TIMEOUT][446] ([i915#12917]) -> [SKIP][447] ([i915#4270]) +4 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@gem_pxp@display-protected-crc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [SKIP][448] ([i915#4270]) -> [TIMEOUT][449] ([i915#12917])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-on.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-dg2:          [SKIP][450] ([i915#2575] / [i915#5190]) -> [SKIP][451] ([i915#5190] / [i915#8428]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-y-tiled.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-6/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][452] ([i915#5190] / [i915#8428]) -> [SKIP][453] ([i915#2575] / [i915#5190]) +4 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          [SKIP][454] ([i915#4885]) -> [SKIP][455] ([i915#2575])

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12177/index.html
