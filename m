Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE34F34C7E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 05:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B4310E178;
	Tue, 14 Apr 2026 05:04:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA53F10E09C;
 Tue, 14 Apr 2026 05:03:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8189340131162045307=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fbusy?=
 =?utf-8?q?=3A_Verify_display_reset_happened_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 Apr 2026 05:03:59 -0000
Message-ID: <177614303992.459650.15676465441157433325@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
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

--===============8189340131162045307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_busy: Verify display reset happened (rev2)
URL   : https://patchwork.freedesktop.org/series/164652/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18326_full -> IGTPW_14969_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14969_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14969_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14969_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-9/igt@gem_exec_big@single.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@gem_exec_big@single.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset:
    - shard-glk:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:
    - shard-snb:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-snb4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:
    - shard-rkl:          [PASS][7] -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:
    - shard-dg2:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
    - shard-tglu-1:       NOTRUN -> [FAIL][11] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
    - shard-dg1:          [PASS][12] -> [FAIL][13] +2 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-16/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
    - shard-mtlp:         [PASS][14] -> [FAIL][15] +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-8/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][16] ([i915#5354]) -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_14969_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#11078] / [i915#14544])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3936])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#3936])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_busy@semaphore.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][22] ([i915#13356])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#9323]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#9323]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#9323]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#9323]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][27] ([i915#12392] / [i915#13356])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][28] -> [FAIL][29] ([i915#15454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][31] -> [FAIL][32] ([i915#9561]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#5882]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][35] ([i915#13390])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][36] ([i915#13390])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4812]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#4525]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_exec_fence@submit67.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4812]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][43] +116 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb5/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_exec_reloc@basic-wc-cpu.html
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][52] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4613] / [i915#7582])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#12193]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4565]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4613]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#8289])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#8289])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4077]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_mmap_wc@coherency.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4083]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_mmap_wc@coherency.html
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4083]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_mmap_wc@coherency.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#14544] / [i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-glk11:        NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#13398])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          [PASS][75] -> [SKIP][76] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_readwrite@write-bad-handle.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3282]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][79] +102 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190] / [i915#8428])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_render_tiled_blits@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gem_render_tiled_blits@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#8411])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4077]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#15657])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4879])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][93] ([i915#13356] / [i915#14586])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-mtlp:         NOTRUN -> [SKIP][94] +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#2856]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#2527]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#14544] / [i915#2527]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gen9_exec_parse@shadow-peek.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#14073]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#13786])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][104] ([i915#15481])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][105] ([i915#13029] / [i915#14545])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#8399])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#6590]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#6590]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#6590]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-7/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#6590]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][111] ([i915#13790] / [i915#2681]) +1 other test warn
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#11681] / [i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][113] ([i915#15365])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@i915_pm_rps@reset.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][114] -> [SKIP][115] ([i915#7984])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-8/igt@i915_power@sanity.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6245])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#5723])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][118] ([i915#4817])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4212]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4212]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#4212]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#12454] / [i915#12712])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#12454] / [i915#12712])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#12761]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-mtlp:         NOTRUN -> [FAIL][127] ([i915#5956]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5286]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#14544] / [i915#5286])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#5286]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#5286]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3638]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3638])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#5190]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6187])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][137] +19 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5190]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#14544])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +14 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#14098] / [i915#14544] / [i915#6095]) +10 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#14098] / [i915#6095]) +46 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#6095]) +46 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#6095]) +231 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#6095]) +74 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#6095]) +44 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-glk11:        NOTRUN -> [SKIP][149] +32 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][151] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +112 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#6095]) +49 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#14544] / [i915#6095]) +12 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][156] +419 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#13781]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#11151] / [i915#7828]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#11151] / [i915#7828]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][162] +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#11151] / [i915#7828]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#11151] / [i915#7828]) +11 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#15330] / [i915#3116] / [i915#3299])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#15330])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#15330])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#15865]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#15865]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#15865]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#15865] / [i915#4423])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#15865]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#15865])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#3555]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#14544] / [i915#3555]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#3555]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3555]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#13049])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][181] -> [FAIL][182] ([i915#13566]) +5 other tests fail
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3555]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3555]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#8814]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][186] -> [FAIL][187] ([i915#13566]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][188] ([i915#13566]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][189] ([i915#13566])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#13049])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#13049]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][192] ([i915#12358] / [i915#14152] / [i915#7882])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][193] ([i915#12358] / [i915#14152])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#9809])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#13046] / [i915#5354])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#4103] / [i915#4213])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#4103])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#4103] / [i915#4213])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#4103])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#4213])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#9723])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#9723])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#14544] / [i915#3804])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#13749])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#13749])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#13707])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#14544] / [i915#3555] / [i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3840] / [i915#9053])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][211] ([i915#9878])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#1839])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#1839]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#9934]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#4423] / [i915#9934])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#3637] / [i915#9934]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3637] / [i915#9934]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#9934])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9934]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#3637] / [i915#9934]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#9934])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#14544] / [i915#9934]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-dg1:          [PASS][223] -> [DMESG-WARN][224] ([i915#4423])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-18/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#15643]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#15643]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#15643]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#15643]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#15643]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#15643]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [PASS][231] -> [FAIL][232] ([i915#15389] / [i915#6880])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#1825]) +15 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][234] +49 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#1825]) +34 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#5439])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#15102]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#15102]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#14544] / [i915#15102])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#15102] / [i915#3458]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#15102] / [i915#3458]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][242] +17 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] +41 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#8708]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#15102]) +16 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#5439])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#15102]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#15102] / [i915#3023]) +15 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#15102]) +21 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#8708]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#5354]) +7 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#14544] / [i915#1825]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#8708]) +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][255] -> [SKIP][256] ([i915#3555] / [i915#8228])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8228])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#6403] / [i915#8826])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#9457]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#8826] / [i915#9457])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#15458])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#15458])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#15815])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#15815])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][268] ([i915#12756] / [i915#13409] / [i915#13476])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][269] ([i915#13409] / [i915#13476])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#14544] / [i915#15709])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#15709]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#15709]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15709])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#15709]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#15608]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#15709]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#15709]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [PASS][278] -> [INCOMPLETE][279] ([i915#13026])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#13958])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#13958])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#13958]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#14259])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#15329]) +14 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#15329]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#15329]) +11 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#15329]) +14 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#15329] / [i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#12343])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#12343])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#15751])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [FAIL][292] ([i915#15752])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3361])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#15128])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#8430])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#8430])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#8430])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#8430])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#8430])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][300] -> [SKIP][301] ([i915#15073]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#15073]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#15073])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][304] -> [SKIP][305] ([i915#15073]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#15073])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][307] -> [SKIP][308] ([i915#15073])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#15073])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][310] ([i915#10553])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][311] ([i915#11520]) +13 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][312] ([i915#11520])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#11520]) +6 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#12316]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#11520] / [i915#14544]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#11520]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#11520]) +9 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][318] ([i915#11520]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][319] ([i915#11520]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#11520]) +6 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#11520]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +13 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +19 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-plane-move.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#1072] / [i915#9732]) +11 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#9732]) +19 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#9688]) +8 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#9732]) +12 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#9685]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#4235])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#5289])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#12755] / [i915#15867])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12755] / [i915#15867])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#5289]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#3555] / [i915#8809] / [i915#8823])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][335] ([i915#12276]) +1 other test incomplete
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#11920])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#9906])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][338] ([i915#4349]) +2 other tests fail
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@module-unload:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][339] ([i915#13520])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#8516])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][341] -> [ABORT][342] ([i915#15131])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@perf_pmu@rc6-suspend.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#3708])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#3708])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][346] ([i915#12910]) +9 other tests fail
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#4818])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-dg2:          [ABORT][348] ([i915#15131]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@gem_softpin@noreloc-s3.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][350] ([i915#12964]) -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [INCOMPLETE][352] ([i915#13356]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk4/igt@i915_pm_rpm@system-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [INCOMPLETE][354] ([i915#4817]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][356] ([i915#4817]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk8/igt@i915_suspend@sysfs-reader.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][358] ([i915#15733] / [i915#5138]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-dg1:          [DMESG-WARN][360] ([i915#4423]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-18/igt@kms_invalid_mode@bad-vsync-start.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][362] ([i915#15459]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][364] ([i915#12756] / [i915#13476]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][366] ([i915#13476]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_plane_cursor@viewport:
    - shard-mtlp:         [DMESG-WARN][368] -> [PASS][369] +1 other test pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-5/igt@kms_plane_cursor@viewport.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][370] ([i915#15073]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [SKIP][372] ([i915#14544] / [i915#15073]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][374] ([i915#15073]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          [SKIP][376] ([i915#15073]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
#### Warnings ####

  * igt@drm_buddy@drm_buddy:
    - shard-rkl:          [SKIP][378] ([i915#14544] / [i915#15678]) -> [SKIP][379] ([i915#15678])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@drm_buddy@drm_buddy.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@drm_buddy@drm_buddy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          [SKIP][380] ([i915#14544] / [i915#7697]) -> [SKIP][381] ([i915#7697])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][382] ([i915#4525]) -> [SKIP][383] ([i915#14544] / [i915#4525])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          [SKIP][384] ([i915#14544] / [i915#4525]) -> [SKIP][385] ([i915#4525])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-rkl:          [SKIP][386] ([i915#14544] / [i915#3281]) -> [SKIP][387] ([i915#3281]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][388] ([i915#3281]) -> [SKIP][389] ([i915#14544] / [i915#3281]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][390] ([i915#2190]) -> [SKIP][391] ([i915#14544] / [i915#2190])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@gem_huc_copy@huc-copy.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][392] ([i915#4613]) -> [SKIP][393] ([i915#14544] / [i915#4613]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          [SKIP][394] ([i915#3282]) -> [SKIP][395] ([i915#14544] / [i915#3282])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@gem_madvise@dontneed-before-pwrite.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][396] ([i915#13717] / [i915#14544]) -> [SKIP][397] ([i915#13717])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [ABORT][398] ([i915#15131]) -> [INCOMPLETE][399] ([i915#13356])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#2527]) -> [SKIP][401] ([i915#2527]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          [SKIP][402] ([i915#2527]) -> [SKIP][403] ([i915#14544] / [i915#2527])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          [ABORT][404] -> [ABORT][405] ([i915#15481]) +1 other test abort
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-14/igt@i915_module_load@fault-injection.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@i915_module_load@fault-injection.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [ABORT][406] ([i915#15140]) -> [INCOMPLETE][407] ([i915#4817])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          [SKIP][408] ([i915#14544] / [i915#7707]) -> [SKIP][409] ([i915#7707])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][410] ([i915#14544] / [i915#5286]) -> [SKIP][411] ([i915#5286]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][412] ([i915#5286]) -> [SKIP][413] ([i915#14544] / [i915#5286])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          [SKIP][414] ([i915#4538] / [i915#5286]) -> [SKIP][415] ([i915#4423] / [i915#4538] / [i915#5286])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#3828]) -> [SKIP][417] ([i915#3828]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][418] ([i915#3638]) -> [SKIP][419] ([i915#14544] / [i915#3638]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][420] -> [SKIP][421] ([i915#14544]) +7 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-rkl:          [SKIP][422] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][423] ([i915#14098] / [i915#6095]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][424] ([i915#6095]) -> [SKIP][425] ([i915#14544] / [i915#6095]) +3 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][426] ([i915#14098] / [i915#6095]) -> [SKIP][427] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#6095]) -> [SKIP][429] ([i915#6095]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][430] ([i915#12313]) -> [SKIP][431] ([i915#12313] / [i915#14544])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg1:          [SKIP][432] ([i915#4423] / [i915#6095]) -> [SKIP][433] ([i915#6095])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          [SKIP][434] ([i915#14544]) -> [SKIP][435] +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          [SKIP][436] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][437] ([i915#11151] / [i915#7828]) +4 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          [SKIP][438] ([i915#11151] / [i915#7828]) -> [SKIP][439] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][440] ([i915#15330] / [i915#3116]) -> [SKIP][441] ([i915#14544] / [i915#15330] / [i915#3116])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#15865]) -> [SKIP][443] ([i915#15865]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_content_protection@legacy.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][444] ([i915#15865]) -> [SKIP][445] ([i915#14544] / [i915#15865])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_content_protection@srm.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][446] ([i915#13049]) -> [SKIP][447] ([i915#13049] / [i915#3359])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          [SKIP][448] ([i915#13049] / [i915#3359]) -> [SKIP][449] ([i915#13049])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][450] ([i915#3555] / [i915#3804]) -> [SKIP][451] ([i915#14544] / [i915#3555] / [i915#3804])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][452] ([i915#13707]) -> [SKIP][453] ([i915#13707] / [i915#14544])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][454] ([i915#13707] / [i915#14544]) -> [SKIP][455] ([i915#13707])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][456] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][457] ([i915#3555] / [i915#3840])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#1839]) -> [SKIP][459] ([i915#1839])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#9934]) -> [SKIP][461] ([i915#9934]) +5 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-rkl:          [SKIP][462] ([i915#9934]) -> [SKIP][463] ([i915#14544] / [i915#9934]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          [SKIP][464] ([i915#15643] / [i915#4423]) -> [SKIP][465] ([i915#15643]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][466] ([i915#15643]) -> [SKIP][467] ([i915#14544] / [i915#15643]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-mtlp:         [SKIP][468] ([i915#15672]) -> [SKIP][469]
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#1825]) -> [SKIP][471] ([i915#1825]) +14 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][472] ([i915#15104] / [i915#4423]) -> [SKIP][473] ([i915#15104])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          [SKIP][474] ([i915#4423]) -> [SKIP][475]
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][476] ([i915#1825]) -> [SKIP][477] ([i915#14544] / [i915#1825]) +12 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][478] ([i915#15102] / [i915#3458]) -> [SKIP][479] ([i915#10433] / [i915#15102] / [i915#3458]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][480] ([i915#5439]) -> [SKIP][481] ([i915#14544] / [i915#5439])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#15102]) -> [SKIP][483] ([i915#15102]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][484] ([i915#15102]) -> [SKIP][485] ([i915#14544] / [i915#15102])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][486] ([i915#15102] / [i915#3023]) -> [SKIP][487] ([i915#14544] / [i915#15102] / [i915#3023]) +6 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][488] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][489] ([i915#15102] / [i915#3458]) +2 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][491] ([i915#15102] / [i915#3023]) +4 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][492] ([i915#13331]) -> [SKIP][493] ([i915#12713])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][494] ([i915#1187] / [i915#12713]) -> [SKIP][495] ([i915#12713])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][496] ([i915#14544] / [i915#15460]) -> [SKIP][497] ([i915#15460])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          [SKIP][498] ([i915#15638] / [i915#15722]) -> [SKIP][499] ([i915#14544] / [i915#15638] / [i915#15722])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#15709]) -> [SKIP][501] ([i915#15709])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-rkl:          [SKIP][502] ([i915#15709]) -> [SKIP][503] ([i915#14544] / [i915#15709]) +2 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#3555]) -> [SKIP][505] ([i915#3555])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][506] ([i915#14259]) -> [SKIP][507] ([i915#14259] / [i915#14544])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_plane_multiple@tiling-4.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][508] ([i915#5354]) -> [SKIP][509] ([i915#14544] / [i915#5354])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][510] ([i915#9340]) -> [SKIP][511] ([i915#3828])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          [SKIP][512] ([i915#9340]) -> [SKIP][513] ([i915#3828])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][514] ([i915#11520]) -> [SKIP][515] ([i915#11520] / [i915#14544]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@pr-primary-blt:
    - shard-rkl:          [SKIP][516] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][517] ([i915#1072] / [i915#9732]) +6 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_psr@pr-primary-blt.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-dg1:          [SKIP][518] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][519] ([i915#1072] / [i915#9732])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_psr@pr-sprite-mmap-gtt.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][520] ([i915#1072] / [i915#9732]) -> [SKIP][521] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][522] ([i915#9685]) -> [SKIP][523] ([i915#14544] / [i915#9685])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][524] ([i915#15867]) -> [SKIP][525] ([i915#12755] / [i915#15867])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          [SKIP][526] ([i915#3555]) -> [SKIP][527] ([i915#14544] / [i915#3555]) +3 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][528] ([i915#8623]) -> [SKIP][529] ([i915#14544] / [i915#8623])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#2434]) -> [SKIP][531] ([i915#2434])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@perf@mi-rpc.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][532] ([i915#14544] / [i915#2435]) -> [SKIP][533] ([i915#2435])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][534] ([i915#2433]) -> [SKIP][535] ([i915#14544] / [i915#2433])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][536] ([i915#3291] / [i915#3708]) -> [SKIP][537] ([i915#14544] / [i915#3291] / [i915#3708])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@prime_vgem@basic-write.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          [SKIP][538] ([i915#9917]) -> [SKIP][539] ([i915#14544] / [i915#9917])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751
  [i915#15752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6403
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9457
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8854 -> IGTPW_14969
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18326: c8bad7becc008716c8475847328c549e178c813c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14969: 68120f30e06d002f4f69835a6976822180d03cc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/index.html

--===============8189340131162045307==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/kms_busy: Verify display reset happened (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164652/">https://patchwork.freedesktop.org/series/164652/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18326_full -&gt; IGTPW_14969_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14969_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14969_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14969_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-9/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@gem_exec_big@single.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-snb4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">FAIL</a> +2 other tests fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">FAIL</a> +2 other tests fail</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-16/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">FAIL</a> +2 other tests fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-8/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14969_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454">i915#15454</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk5/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb5/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">SKIP</a> +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk5/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk3/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk9/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@i915_pm_rps@reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-8/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +231 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +419 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-18/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389">i915#15389</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6403">i915#6403</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9457">i915#9457</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9457">i915#9457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +14 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751">i915#15751</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752">i915#15752</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-16/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk11/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-snb6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-2/igt@perf_pmu@module-unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-1/igt@perf_pmu@rc6-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-5/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk6/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-glk8/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-glk3/igt@i915_suspend@sysfs-reader.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-18/igt@kms_invalid_mode@bad-vsync-start.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_invalid_mode@bad-vsync-start.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-5/igt@kms_plane_cursor@viewport.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-8/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-14/igt@i915_module_load@fault-injection.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-mtlp-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#13331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-2/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg1-17/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg1-19/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-7/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18326/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14969/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8854 -&gt; IGTPW_14969</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18326: c8bad7becc008716c8475847328c549e178c813c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14969: 68120f30e06d002f4f69835a6976822180d03cc5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8189340131162045307==--
