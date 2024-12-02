Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9757EE69E99
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 23:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298AB10E234;
	Mon,  2 Dec 2024 23:10:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108F10E00E;
 Mon,  2 Dec 2024 23:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_test/intel/xe=5Fsysfs=3A?=
 =?utf-8?q?_Restore_sysfs_params_correctly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Dec 2024 23:10:26 -0000
Message-ID: <173318102697.1793305.1374625173018850067@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241202180816.47538-1-jonathan.cavitt@intel.com>
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

Series: test/intel/xe_sysfs: Restore sysfs params correctly
URL   : https://patchwork.freedesktop.org/series/142000/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15772_full -> IGTPW_12229_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12229_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12229_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12229_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][1] +21 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][2] +4 other tests incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-tglu:         NOTRUN -> [ABORT][3] +25 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-2/igt@gem_exec_balancer@bonded-dual.html

  * igt@i915_pm_rps@fence-order:
    - shard-tglu-1:       NOTRUN -> [ABORT][4] +3 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@i915_pm_rps@fence-order.html
    - shard-dg1:          NOTRUN -> [ABORT][5] +21 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@i915_pm_rps@fence-order.html

  * igt@perf@oa-exponents:
    - shard-dg2:          NOTRUN -> [ABORT][6] +20 other tests abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-7/igt@perf@oa-exponents.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [ABORT][7] +28 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-mtlp:         NOTRUN -> [ABORT][8] +4 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@render-node-busy@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][9] +15 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk1/igt@perf_pmu@render-node-busy@rcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_balancer@full:
    - {shard-dg2-9}:      NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-9/igt@gem_exec_balancer@full.html

  
Known issues
------------

  Here are the changes found in IGTPW_12229_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-1/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9318])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@debugfs_test@basic-hwmon.html
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#9318])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#11078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8414]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-5/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#8562])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#8562])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [PASS][28] -> [FAIL][29] ([i915#11980] / [i915#12580])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15772/shard-tglu-2/igt@gem_ctx_persistence@hostile.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#4525]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][33] ([i915#11965]) +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@gem_exec_fence@submit3.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4812]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-10/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3281]) +12 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-10/igt@gem_exec_reloc@basic-active.html
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#3281]) +10 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3281]) +10 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3281])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4537] / [i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#2190])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#2190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([i915#2190])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4613]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@gem_lmem_swapping@verify-random.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4613]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#8289])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4077]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4083]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3282]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3282]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3282]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3282])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][59] ([i915#12917] / [i915#12964])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][61] ([i915#12964])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4270]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#8428])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4079])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4079])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4879])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3297])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4880])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3281] / [i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@gem_userptr_blits@relocations.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][75] +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#2527] / [i915#2856]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#2527]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#8399])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#8399])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][82] ([i915#12455]) +1 other test incomplete
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#11681])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][84] ([i915#4817])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk1/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#7707])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4212])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4212])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#5286]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#5286])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5286]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#5286]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4538] / [i915#5190]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3638]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][95] +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][97] +25 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#10434] / [i915#6095])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][99] +218 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#10307] / [i915#6095]) +38 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#12805])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#12805])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#6095]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#6095]) +49 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#6095]) +46 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#6095]) +53 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#6095]) +14 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#7828]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#7828]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#7828]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#7828])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#7828]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3555] / [i915#9979])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@kms_color@deep-color.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][114] -> [DMESG-WARN][115] ([i915#12964]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15772/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3555]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#13049])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#13049])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#13049])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#13049])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#4103])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4103] / [i915#4213])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#4103])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4103] / [i915#4213])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          NOTRUN -> [FAIL][125] ([i915#2346]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][126] ([i915#12170])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][127] ([i915#11968])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#3555]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3555]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-1/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#3555]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-10/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#1257])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#1257])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#1257])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#1257])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#12402])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#12402])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#12402])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#8812])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#8812])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#3469])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#1839])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-1/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#1839])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#1839])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#1839])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#9337])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#9337])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#9337])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#9337])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#9934]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning.html
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#9934]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][151] ([i915#12745] / [i915#1982] / [i915#4839])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][152] ([i915#1982] / [i915#4839])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3637]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#3637])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#9934]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#2672] / [i915#3555]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#2672]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#2587] / [i915#2672] / [i915#3555])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#2587] / [i915#2672]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#2672] / [i915#3555]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#2672] / [i915#3555]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#2672] / [i915#3555]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#2672]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#2587] / [i915#2672]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3023]) +18 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3458]) +11 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3458]) +13 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#8708]) +16 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#8708])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#5354]) +28 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#10433] / [i915#3458]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#8708]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#1825]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#1825]) +38 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][178] +50 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8228])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555] / [i915#8228]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3555] / [i915#8228]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#3555] / [i915#8228])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3555] / [i915#8228])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_legacy_colorkey@basic:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][184] ([i915#12964]) +4 other tests dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@kms_legacy_colorkey@basic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-tglu:         NOTRUN -> [ABORT][185] ([i915#10159])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][186] ([i915#12756] / [i915#1982]) +1 other test incomplete
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][187] ([i915#12169])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][188] ([i915#10647]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#12247]) +8 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#12247]) +14 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#12247]) +9 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#9812])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#5354])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3361])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][195] ([i915#9295])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#9519]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#9519]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#9519]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#11520]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][200] ([i915#11520]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#11520])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#12316])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#11520]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#11520]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][205] ([i915#11520]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#11520]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#9683]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9683]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#9683]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-13/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9683]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#1072] / [i915#9732]) +11 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#1072] / [i915#9732]) +16 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#9732]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-snb:          NOTRUN -> [SKIP][214] +288 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-snb7/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#1072] / [i915#9732]) +13 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9685])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9685])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#9685])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#9685])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#4884])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#4235])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#12755] / [i915#5190]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#5289]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#5289]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#5289]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#12755]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3555] / [i915#5030] / [i915#9041])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#5030]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#5030] / [i915#9041])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][230] ([i915#13179]) +1 other test abort
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][231] ([i915#13179]) +1 other test abort
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][232] ([i915#12276]) +1 other test incomplete
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#2437])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8850])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#8850])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#8850])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-17/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#8850])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-tglu-4/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8516])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#8516])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#8516])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][241] ([i915#9351])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][242] ([i915#9351])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3708])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3708])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [DMESG-WARN][245] ([i915#12964]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15772/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11968
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12170
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8133 -> IGTPW_12229
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15772: e3a2a984e96718e036e66185ab8c7ed2a2d7201f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12229: 569a859f53b6b6b4089f223f26f3bd4f3cbc455a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12229/index.html
