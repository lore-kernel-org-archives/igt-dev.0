Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DB5C02193
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 13:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D04C10E09D;
	Wed, 29 Jan 2025 13:52:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E804B10E09D;
 Wed, 29 Jan 2025 13:52:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8901234631668188702=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=3A_sync_intel_PCI_ID?=
 =?utf-8?q?_macros_with_kernel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jan 2025 13:52:31 -0000
Message-ID: <173815875192.2426076.18417702138462385338@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129003155.91475-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250129003155.91475-1-matthew.s.atwood@intel.com>
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

--===============8901234631668188702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: sync intel PCI ID macros with kernel
URL   : https://patchwork.freedesktop.org/series/144077/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16037_full -> IGTPW_12510_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12510_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12510_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12510_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_render_copy_redux@interruptible:
    - shard-dg1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-18/igt@gem_render_copy_redux@interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_render_copy_redux@interruptible.html

  * igt@perf_pmu@module-unload:
    - shard-mtlp:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-6/igt@perf_pmu@module-unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@perf_pmu@module-unload.html
    - shard-dg2:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-2/igt@perf_pmu@module-unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_12510_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#6230])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-idle.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8414])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_basic@multigpu-create-close:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#4873])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#7697]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8562])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#280]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][31] ([i915#8898]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#4525])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#4525])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#6334]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#6334]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-glk:          NOTRUN -> [DMESG-WARN][39] ([i915#118])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_exec_flush@basic-uc-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3281]) +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3281]) +10 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4537])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4537] / [i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4812]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4860])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4613] / [i915#7582])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4613]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@gem_lmem_swapping@random-engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_lmem_swapping@random-engines.html
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#12193]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4565]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#8289])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4077]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4077]) +17 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_mmap_wc@read-write-distinct.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4083]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gem_pwrite@basic-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#8428]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][80] -> [INCOMPLETE][81] ([i915#13306])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk4/igt@gem_softpin@noreloc-s3.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][82] ([i915#13263] / [i915#13449])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4879])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#4880])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3281] / [i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][90] -> [INCOMPLETE][91] ([i915#13356])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk3/igt@gem_workarounds@suspend-resume-context.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk9/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][92] +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@gen9_exec_parse@allowed-all.html
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#2856]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gen9_exec_parse@allowed-all.html
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html
    - shard-glk:          NOTRUN -> [ABORT][96] ([i915#5566])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4881])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][101] -> [ABORT][102] ([i915#9820])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [PASS][103] -> [ABORT][104] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [PASS][105] -> [ABORT][106] ([i915#10887] / [i915#9820])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#6412])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#7178])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#7091])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#8436])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][111] ([i915#2681]) +4 other tests warn
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-mtlp:         [PASS][112] -> [ABORT][113] ([i915#13193])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-5/igt@i915_pm_rpm@system-suspend-devices.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#11681] / [i915#6621])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#11681] / [i915#6621])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][116] ([i915#8346])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#11681])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][118] -> [SKIP][119] ([i915#7984])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-2/igt@i915_power@sanity.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#6245])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#6245])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][123] -> [INCOMPLETE][124] ([i915#4817])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk3/igt@i915_suspend@debugfs-reader.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@i915_suspend@debugfs-reader.html
    - shard-mtlp:         [PASS][125] -> [INCOMPLETE][126] ([i915#13491])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4212])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#12454] / [i915#12712])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#12454] / [i915#12712])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#8709]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#8709]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#8709]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#12967])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#10333])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#9531])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#9531])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][139] -> [FAIL][140] ([i915#11808]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#5286]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5286]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][144] -> [FAIL][145] ([i915#5138])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3638]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3638]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +13 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][150] +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6095]) +69 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#12313])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#6095]) +173 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6095]) +29 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#6095]) +102 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#12805])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#6095]) +24 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#6095]) +16 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][161] ([i915#12796])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#10307] / [i915#6095]) +118 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#12313]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3742]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][165] +283 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#11151] / [i915#7828]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#11151] / [i915#7828])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3299])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#3299])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#7162] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#7118] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#7116] / [i915#9424]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3555] / [i915#6944] / [i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#13049])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#13049]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#13049]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][186] ([i915#13566]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8814])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#13049]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3555]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][190] -> [FAIL][191] ([i915#13566]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-tglu-1:       NOTRUN -> [FAIL][192] ([i915#13566]) +3 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][193] ([i915#13566])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][194] -> [DMESG-WARN][195] ([i915#12964]) +42 other tests dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#9809]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13046] / [i915#5354]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#4103] / [i915#4213]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][199] +22 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][200] -> [FAIL][201] ([i915#2346])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#9067])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#9067])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#9067])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#4103] / [i915#4213])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#4103]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][208] ([i915#12170])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][209] ([i915#11968])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#9723])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#9723])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3555]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#1769] / [i915#3555] / [i915#3804])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3804])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#1257])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#12402])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#8812]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8812])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3840])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#3840])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3555] / [i915#3840])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#3840] / [i915#9053])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][224] ([i915#12964])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3469])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#4854])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#1839])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#1839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#1839])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#1839])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#1839])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#9337])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#658])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4881])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9934]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3637]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3637]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#9934]) +7 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          [PASS][239] -> [FAIL][240] ([i915#11989]) +1 other test fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#9934]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#3637]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][243] ([i915#12745] / [i915#4839])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12745])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#2672]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672] / [i915#3555])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555] / [i915#5190])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#2672] / [i915#8813])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#3555] / [i915#8810] / [i915#8813])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8810])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#8708]) +7 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#5354]) +24 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][264] +61 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg2:          [PASS][265] -> [FAIL][266] ([i915#6880]) +2 other tests fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][267] -> [DMESG-FAIL][268] ([i915#12964]) +2 other tests dmesg-fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#10055])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3458]) +12 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#10433] / [i915#3458])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#8708]) +26 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] +29 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#1825]) +12 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1825]) +28 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][276] +81 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#3023]) +32 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#9766])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#8708]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#3458]) +24 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#12713])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#3555] / [i915#8228])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#10656])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#12388])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#12388])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#10656])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#12388])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#12388])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#10656] / [i915#13522])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#13522])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#13522])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#13522])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#6301])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#12247]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#12247] / [i915#9423])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#12247]) +14 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#6953] / [i915#9423])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12247]) +7 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#12247] / [i915#3555])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#12247] / [i915#3555])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#12247] / [i915#6953])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#12247] / [i915#6953])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#12247]) +17 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#12247] / [i915#3555] / [i915#6953])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#12247]) +22 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#5354])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12343])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#5354])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_pm_backlight@fade.html
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#9812])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#9292])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#9685])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#3828])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         [PASS][318] -> [FAIL][319] ([i915#12912])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9685])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#9340])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#8430])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][325] -> [SKIP][326] ([i915#9519])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#6524])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#6524])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#6524])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#6524] / [i915#6805])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#11520]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#12316]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][333] ([i915#11520]) +10 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#11520]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#11520]) +9 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#11520]) +11 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#11520]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][338] ([i915#11520]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#9683])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#9683])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#9683])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9683])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +27 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#9732]) +20 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +14 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#9688]) +12 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9732]) +5 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#1072] / [i915#9732]) +30 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#4077] / [i915#9688]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#12755]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#5289]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#5289])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#5289])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#5289]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#3555]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][356] ([i915#5465]) +2 other tests fail
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#3555]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#11920])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9906]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#9906]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#9906])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#9906]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#9906])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#8808] / [i915#9906])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][365] ([i915#2437]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#2437])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#2437] / [i915#9412])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#2437])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#2437] / [i915#9412])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#2436])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#7387])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#2434])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][373] +465 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#8850])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu-1:       NOTRUN -> [SKIP][375] ([i915#8850])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#8850])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#8850])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#8850])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency:
    - shard-tglu:         [PASS][379] -> [FAIL][380] ([i915#12549]) +1 other test fail
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-10/igt@perf_pmu@frequency.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@perf_pmu@frequency.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          NOTRUN -> [FAIL][381] ([i915#4349]) +1 other test fail
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][382] ([i915#12964]) +23 other tests dmesg-warn
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#8516])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#8516])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#3708]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#3708]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][387] ([i915#3708])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#3708]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#9917])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][390] ([i915#12910])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sysfs_heartbeat_interval@nopreempt:
    - shard-mtlp:         NOTRUN -> [ABORT][391] ([i915#13193])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#4818])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_caching@writes:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12917] / [i915#12964]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-3/igt@gem_caching@writes.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@gem_caching@writes.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][395] ([i915#9561]) -> [PASS][396] +1 other test pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-1/igt@gem_ctx_freq@sysfs.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@create-ext:
    - shard-mtlp:         [ABORT][397] ([i915#13193]) -> [PASS][398] +2 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@create-ext.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@gem_eio@create-ext.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [ABORT][399] ([i915#7975]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@hibernate.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][401] ([i915#5784]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-17/igt@gem_eio@kms.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][403] ([i915#7975] / [i915#8213]) -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][405] ([i915#12455]) -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][407] ([i915#12942]) -> [PASS][408] +1 other test pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [DMESG-FAIL][409] ([i915#12964]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@i915_suspend@sysfs-reader.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:
    - shard-rkl:          [DMESG-WARN][411] ([i915#12964]) -> [PASS][412] +33 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][413] ([i915#11808]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][415] ([i915#12796]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-dg1:          [DMESG-WARN][417] ([i915#4423]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-17/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][419] ([i915#13566]) -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][421] ([i915#13566]) -> [PASS][422] +3 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-tglu:         [FAIL][423] ([i915#11989]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-9/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][425] ([i915#6880]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - {shard-dg2-9}:      [FAIL][427] ([i915#6880]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         [FAIL][429] ([i915#12913]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-4/igt@kms_pm_dc@dc6-dpms.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][431] ([i915#9519]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][433] ([i915#5465]) -> [PASS][434] +2 other tests

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/index.html

--===============8901234631668188702==
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
<tr><td><b>Series:</b></td><td>lib: sync intel PCI ID macros with kernel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144077/">https://patchwork.freedesktop.org/series/144077/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16037_full -&gt; IGTPW_12510_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12510_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12510_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12510_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-internal-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-18/igt@gem_render_copy_redux@interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_render_copy_redux@interruptible.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-6/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@perf_pmu@module-unload.html">INCOMPLETE</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-2/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@perf_pmu@module-unload.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-long-gt0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12510_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> ([i915#8414]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html">SKIP</a> ([i915#1099]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#8898]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> ([i915#4537])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#12193]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledx:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@gem_mmap_gtt@big-bo-tiledx.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_mmap_gtt@medium-copy-odd.html">SKIP</a> ([i915#4077]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html">TIMEOUT</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk4/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#13306])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@gem_tiled_swapping@non-threaded.html">ABORT</a> ([i915#13263] / [i915#13449])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk3/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk9/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> ([i915#13356])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@gen3_render_tiledx_blits.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk9/igt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#8436])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681]) +4 other tests warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-5/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@i915_pm_rpm@system-suspend-devices.html">ABORT</a> ([i915#13193])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@i915_pm_rps@reset.html">FAIL</a> ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-2/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#4817])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#13491])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> ([i915#12967])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_async_flips@test-cursor.html">SKIP</a> ([i915#10333])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#11808]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +173 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html">SKIP</a> ([i915#6095]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#6095]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> +283 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> ([i915#11151] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#11151] / [i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> ([i915#11151] / [i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#13566])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) +42 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> ([i915#9809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#13046] / [i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> ([i915#12170])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html">FAIL</a> ([i915#11968])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#1769] / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#9934]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#9934]) +9 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> ([i915#12745] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([i915#3555] / [i915#8810] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#5354]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">FAIL</a> ([i915#6880]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-FAIL</a> ([i915#12964]) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#3023]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#10656] / [i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> ([i915#13522])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> ([i915#13522])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> ([i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html">SKIP</a> ([i915#12247]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> ([i915#12247]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9292])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> ([i915#12912])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#12316]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> ([i915#1072] / [i915#9732]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> ([i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> ([i915#9688]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_psr@pr-sprite-render.html">SKIP</a> ([i915#9732]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_psr@psr2-primary-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-6/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#12755]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-7/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-snb2/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +465 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-10/igt@perf_pmu@frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@perf_pmu@frequency.html">FAIL</a> ([i915#12549]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6.html">DMESG-WARN</a> ([i915#12964]) +23 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-5/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> ([i915#12910])</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt.html">ABORT</a> ([i915#13193])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-3/igt@gem_caching@writes.html">DMESG-WARN</a> ([i915#12917] / [i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@gem_caching@writes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-1/igt@gem_ctx_freq@sysfs.html">FAIL</a> ([i915#9561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-5/igt@gem_ctx_freq@sysfs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@create-ext:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@create-ext.html">ABORT</a> ([i915#13193]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-8/igt@gem_eio@create-ext.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-7/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-4/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-17/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#12455]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> ([i915#12942]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-1/igt@i915_suspend@sysfs-reader.html">DMESG-FAIL</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-7/igt@i915_suspend@sysfs-reader.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#11808]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12796]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg1-17/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg1-13/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> ([i915#13566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-tglu-9/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">FAIL</a> ([i915#11989]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-tglu-3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-dg2-9}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-mtlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#12913]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16037/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12510/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         [FAIL][433] ([i915#5465]) -&gt; [PASS][434] +2 other tests</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8901234631668188702==--
