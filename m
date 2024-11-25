Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A29ED58D6A
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420F10E18A;
	Mon, 25 Nov 2024 16:58:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0960210E18A;
 Mon, 25 Nov 2024 16:58:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/gpgpu=5Fshader=3A_si?=
 =?utf-8?q?mplify_load/store_shaders_and_add_Xe3_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 16:58:42 -0000
Message-ID: <173255392205.2893121.8957671255862645161@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
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

Series: lib/gpgpu_shader: simplify load/store shaders and add Xe3 support (rev3)
URL   : https://patchwork.freedesktop.org/series/141668/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15738_full -> IGTPW_12190_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12190_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12190_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12190_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@gem_lmem_evict@dontneed-evict-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-snb:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@perf@create-destroy-userspace-config.html

  
#### Warnings ####

  * igt@perf_pmu@busy-double-start:
    - shard-dg2:          [FAIL][9] ([i915#4349]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@perf_pmu@busy-double-start.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@perf_pmu@busy-double-start.html

  
Known issues
------------

  Here are the changes found in IGTPW_12190_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-dg2:          [PASS][11] -> [SKIP][12] +17 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@api_intel_allocator@two-level-inception-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][15] ([i915#11814] / [i915#11815])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +20 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +17 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [PASS][18] -> [SKIP][19] ([i915#2582]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@fbdev@unaligned-read.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#13008])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][22] ([i915#12392] / [i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-clear:
    - shard-rkl:          [PASS][24] -> [DMESG-WARN][25] ([i915#12964]) +76 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@gem_create@create-clear.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@gem_create@create-clear.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8562])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][33] ([i915#10030] / [i915#7975] / [i915#8213])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4036])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4525])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [FAIL][37] ([i915#6117])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#6334]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][40] ([i915#6334]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4537] / [i915#4812]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4812]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [PASS][49] -> [ABORT][50] ([i915#7975] / [i915#8213]) +1 other test abort
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][51] ([i915#7975] / [i915#8213])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#12936])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][56] -> [TIMEOUT][57] ([i915#5493]) +1 other test timeout
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][58] ([i915#5493]) +1 other test timeout
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [PASS][61] -> [SKIP][62] ([i915#12936]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-7/igt@gem_lmem_swapping@verify-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#8289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4077]) +15 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#12975])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu:         [PASS][74] -> [SKIP][75] ([i915#4270]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-2/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4270]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4885])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2575]) +100 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4879])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297] / [i915#4880])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3281] / [i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][87] +42 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@gem_vm_create@invalid-create.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#2527] / [i915#2856]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#2527]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#2527]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#2856]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [PASS][93] -> [FAIL][94] ([i915#12870])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@i915_module_load@reload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          NOTRUN -> [ABORT][95] ([i915#9820])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#8399])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#8399])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#8399]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#6590]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][100] ([i915#2681]) +4 other tests warn
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-dg2:          [PASS][101] -> [SKIP][102] ([i915#13014])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#13014]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#11681]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#11681]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#6245])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-2/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][107] ([i915#1982] / [i915#9311])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][108] ([i915#9311]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][109] ([i915#9311])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg1:          [PASS][110] -> [DMESG-WARN][111] ([i915#4391] / [i915#4423])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-12/igt@i915_suspend@basic-s2idle-without-i915.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-tglu:         [PASS][112] -> [ABORT][113] ([i915#13010])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@i915_suspend@basic-s2idle-without-i915.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-3/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][114] ([i915#7443])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#7707])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#8709]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         NOTRUN -> [FAIL][118] ([i915#11808]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#1769] / [i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#1769] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][121] ([i915#1769])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#5286]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5286]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3638])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#3638]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#5190])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          [PASS][129] -> [DMESG-WARN][130] ([i915#4423])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-12/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5190]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#6095]) +49 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][134] +48 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#6095]) +44 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#12313]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#12313]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6095]) +87 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#6095]) +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#12313]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +162 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#6095]) +137 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3742]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#7213]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#7828]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#7828]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#7828]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +9 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#7828]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3555]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3555] / [i915#9979])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_color@deep-color.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#6944] / [i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-8/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7118] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#6944] / [i915#7116] / [i915#7118])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118] / [i915#9424])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#12976]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#12976])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#12976])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#12976])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-snb:          [PASS][166] -> [SKIP][167] +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#4103]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4103] / [i915#4213])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-glk:          [PASS][170] -> [FAIL][171] ([i915#2346])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-glk8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][172] ([i915#12170])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][173] ([i915#11968])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#9723])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#3555]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#8812])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3555] / [i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#4854])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4854])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#1839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#658])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][183] -> [FAIL][184] ([i915#2122]) +3 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#9934]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#9934]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3637]) +8 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#3637]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9934]) +8 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          NOTRUN -> [FAIL][190] ([i915#2122]) +3 other tests fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][191] ([i915#12840] / [i915#2122])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][192] ([i915#11989])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][193] ([i915#2122]) +2 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#2587] / [i915#2672]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#2672])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#2587] / [i915#2672])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#2672]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#2587] / [i915#2672] / [i915#3555])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672] / [i915#3555])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2672] / [i915#3555]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][205] ([i915#6880])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#5354]) +18 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][207] +44 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] +50 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8708]) +21 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#1825]) +10 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3458]) +21 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][212] +62 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3458]) +18 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#8708]) +25 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3023]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][216] -> [SKIP][217] ([i915#3555] / [i915#8228])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#12713])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#10656])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#12339])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#1839]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#6301])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#6301])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][228] ([i915#12964])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][229] ([i915#12169])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][230] ([i915#10647]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#5354] / [i915#9423])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#2575] / [i915#9423]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#12247]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][234] -> [SKIP][235] ([i915#2575] / [i915#9423]) +4 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][236] +381 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#12247]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#12247] / [i915#6953] / [i915#9423])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#12247] / [i915#6953]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#12247] / [i915#3555])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#12247]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#12247]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#12247]) +17 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#9812])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#5354]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#9685])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#9340])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8430])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#8430])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][250] -> [SKIP][251] ([i915#9519])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#12937]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#9519]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#9519])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][255] -> [SKIP][256] ([i915#9519]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#6524])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][258] ([i915#11520]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#11520]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#11520]) +10 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#11520]) +8 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#11520]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#11520]) +9 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#11520]) +8 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#9683])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9732]) +15 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-10/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#1072] / [i915#9732]) +19 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#9732]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#1072] / [i915#9732]) +23 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9685])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#5289]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2575] / [i915#5190]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#5289])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#5289]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12755] / [i915#5190])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12755])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#3555]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][279] ([i915#5465]) +1 other test fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#3555]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][281] -> [FAIL][282] ([IGT#160])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_sysfs_edid_timing.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#8623])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#8623])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [PASS][285] -> [DMESG-WARN][286] ([i915#12917] / [i915#12964])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][287] ([i915#12964]) +12 other tests dmesg-warn
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9906])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#2437])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@kms_writeback@writeback-check-output.html
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#2437])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#2437] / [i915#9412])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#2437]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-glk2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#2437])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#2437] / [i915#9412])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#2436])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@i915-ref-count:
    - shard-dg2:          [PASS][296] -> [SKIP][297] ([i915#12506]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@perf@i915-ref-count.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@perf@i915-ref-count.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][298] ([i915#9100]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@perf@non-zero-reason.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#12506]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@perf@stress-open-close.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#2433])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          [PASS][301] -> [FAIL][302] ([i915#4349]) +3 other tests fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-18/igt@perf_pmu@busy-double-start@vecs0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#8850])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][304] ([i915#12549] / [i915#6806]) +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [ABORT][305] ([i915#13010])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#8516])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][307] ([i915#9351])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][308] ([i915#9351])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#3708]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3291] / [i915#3708])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3291] / [i915#3708])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#3708]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#9917]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][314] ([i915#12910])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#9917])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#9917])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#2575]) +120 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][319] +5 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][320] ([i915#12866]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@core_getversion@basic.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@core_getversion@basic.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][322] ([i915#11703]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@core_hotunplug@unbind-rebind.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb7/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][324] -> [PASS][325] +22 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][326] ([i915#12392]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [DMESG-WARN][328] ([i915#12964]) -> [PASS][329] +46 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][330] ([i915#5784]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-14/igt@gem_eio@kms.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][332] ([i915#11713]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-10/igt@gem_exec_big@single.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][334] ([i915#7975] / [i915#8213]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-dg2:          [SKIP][336] ([i915#12936]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_lmem_swapping@verify.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_offset@close-race:
    - shard-snb:          [INCOMPLETE][338] -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb4/igt@gem_mmap_offset@close-race.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb2/igt@gem_mmap_offset@close-race.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [SKIP][340] ([i915#4270]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-rkl:          [DMESG-WARN][342] ([i915#12917] / [i915#12964]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@gem_userptr_blits@map-fixed-invalidate.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][344] ([i915#9820]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][346] ([i915#12942]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg2:          [SKIP][348] ([i915#13014]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@i915_pm_rpm@debugfs-read.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][350] -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_pm_rpm@reg-read-ioctl.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][352] -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@i915_selftest@live.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][354] ([i915#13010]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][356] -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@i915_suspend@basic-s3-without-i915.html
    - shard-rkl:          [INCOMPLETE][358] ([i915#12964] / [i915#4817]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html
    - shard-dg1:          [DMESG-WARN][360] ([i915#4391] / [i915#4423]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-14/igt@i915_suspend@basic-s3-without-i915.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-13/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [DMESG-FAIL][362] ([i915#12964]) -> [PASS][363] +2 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-tglu:         [ABORT][364] ([i915#10354]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][366] ([i915#2346]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [FAIL][368] ([i915#2122]) -> [PASS][369] +7 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg1:          [DMESG-WARN][370] ([i915#4423]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-13/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [FAIL][372] ([i915#11989] / [i915#2122]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          [SKIP][374] -> [PASS][375] +2 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2:          [SKIP][376] ([i915#13012]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@kms_hdmi_inject@inject-audio.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [SKIP][378] ([i915#13012]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [SKIP][380] ([i915#2575] / [i915#9423]) -> [PASS][381] +6 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][382] ([i915#12937]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][384] ([i915#9519]) -> [PASS][385] +2 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][386] ([i915#12722] / [i915#5465]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][388] ([i915#12722]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-1:
    - shard-tglu:         [FAIL][390] ([i915#5465]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-tglu-8/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html

  * igt@perf@polling:
    - shard-dg2:          [SKIP][392] ([i915#12506]) -> [PASS][393] +8 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@perf@polling.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-2/igt@perf@polling.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][394] ([i915#4349]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-4/igt@perf_pmu@most-busy-check-all@rcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@perf_pmu@most-busy-check-all@rcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][396] ([i915#4349]) -> [PASS][397] +3 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [FAIL][398] ([i915#4349]) -> [PASS][399] +5 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-4/igt@perf_pmu@semaphore-busy@vecs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_busy@before:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [PASS][401] +157 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@prime_busy@before.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@prime_busy@before.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [SKIP][402] -> [ABORT][403] ([i915#5507])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          [SKIP][404] ([i915#12506]) -> [SKIP][405] ([i915#8414])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang-all.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#3936])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_busy@semaphore.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-6/igt@gem_busy@semaphore.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          [SKIP][408] ([i915#280]) -> [SKIP][409] ([i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#4812])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#6334])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][414] ([i915#3539] / [i915#4852]) -> [SKIP][415] ([i915#2575])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-4/igt@gem_exec_flush@basic-uc-ro-default.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][416] ([i915#3539]) -> [SKIP][417] ([i915#2575])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@gem_exec_flush@basic-uc-set-default.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#3539] / [i915#4852])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_flush@basic-wb-set-default.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-1/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#3281]) +11 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          [SKIP][422] ([i915#3281]) -> [SKIP][423] ([i915#2575]) +6 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-wc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][424] ([i915#4537] / [i915#4812]) -> [SKIP][425] ([i915#2575])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [ABORT][427] ([i915#7975] / [i915#8213])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#4860])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          [SKIP][430] ([i915#4860]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#284])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_media_vme.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-3/igt@gem_media_vme.html

  * igt@gem_mmap@bad-size:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#4083]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_mmap@bad-size.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4077]) +5 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          [SKIP][438] ([i915#4077]) -> [SKIP][439] ([i915#2575]) +8 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-5/igt@gem_mmap_gtt@zero-extend.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          [SKIP][440] ([i915#4083]) -> [SKIP][441] ([i915#2575]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@gem_mmap_wc@close.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          [SKIP][442] ([i915#3282]) -> [SKIP][443] ([i915#2575]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@gem_partial_pwrite_pread@write-uncached.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#3282]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_pwrite@basic-random.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-4/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][446] ([i915#4270]) -> [TIMEOUT][447] ([i915#12964])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          [SKIP][448] ([i915#4270]) -> [SKIP][449] ([i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-dg2-11/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [TIMEOUT][450] ([i915#12964]) -> [SKIP][451] ([i915#4270])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [TIMEOUT][452] ([i915#12917] / [i915#12964]) -> [SKIP][453] ([i915#4270]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          [SKIP][454] ([i915#2575]) -> [SKIP][455] ([i915#4270])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12190/index.html
