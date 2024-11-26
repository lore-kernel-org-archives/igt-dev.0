Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B174D5A6D1
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 03:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4C310E18D;
	Tue, 26 Nov 2024 03:04:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192010E18D;
 Tue, 26 Nov 2024 03:04:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault?=
 =?utf-8?q?=5Finjection=3A_Pick_a_valid_PAT_index_for_vm=5Fbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 03:04:25 -0000
Message-ID: <173259026534.3135515.880555517162413975@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125185432.1187252-1-matthew.d.roper@intel.com>
In-Reply-To: <20241125185432.1187252-1-matthew.d.roper@intel.com>
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

Series: tests/intel/xe_fault_injection: Pick a valid PAT index for vm_bind
URL   : https://patchwork.freedesktop.org/series/141767/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15744_full -> IGTPW_12196_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12196_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12196_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (1): shard-dg2-9 
  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12196_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [PASS][10] -> [ABORT][11] +3 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-mtlp:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-4/igt@kms_psr@psr2-sprite-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_psr@psr2-sprite-blt.html

  * igt@perf_pmu@busy-idle-no-semaphores:
    - shard-dg2:          NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@perf_pmu@busy-idle-no-semaphores.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][16] ([i915#12964]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html

  
Known issues
------------

  Here are the changes found in IGTPW_12196_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8414]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@drm_fdinfo@virtual-busy-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8414])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [PASS][22] -> [SKIP][23] ([i915#2582])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@fbdev@unaligned-write.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#9323]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][30] ([i915#7297]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-2/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@gem_ccs@suspend-resume.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#9310])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@gem_compute@compute-square.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#11980] / [i915#12580])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][34] ([i915#11980] / [i915#12580])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb7/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#5882]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][38] -> [ABORT][39] ([i915#7975] / [i915#8213])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-18/igt@gem_eio@hibernate.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4771])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4771])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][44] ([i915#11713])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][45] ([i915#11965] / [i915#12558]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4812])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#5107])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#3281]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3281]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4537] / [i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][57] +87 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb2/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-rkl:          [PASS][58] -> [DMESG-WARN][59] ([i915#12917] / [i915#12964]) +4 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-1/igt@gem_exec_whisper@basic-queues-priority.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4860])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          [PASS][63] -> [SKIP][64] ([i915#12936]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-7/igt@gem_lmem_swapping@heavy-verify-multi.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#12936]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk8/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4613]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-2/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#284])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#284])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4083]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@gem_mmap@bad-object.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4077]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-1/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4083]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3282]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12964])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4270])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#4270])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         [PASS][83] -> [SKIP][84] ([i915#4270]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][86] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#3282]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8428]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2575] / [i915#5190]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190] / [i915#8428]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4079]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4079])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4077]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_unfence_active_buffers:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4879])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4958])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3297]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][98] +13 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#2856]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2856])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [PASS][104] -> [FAIL][105] ([i915#12870])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@i915_module_load@reload.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][106] -> [ABORT][107] ([i915#9820])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#6412])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#7178])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#6412])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#6412])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#8399])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][114] -> [INCOMPLETE][115] ([i915#12455]) +1 other test incomplete
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [PASS][116] -> [SKIP][117] ([i915#13014]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-6/igt@i915_pm_rpm@sysfs-read.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#13014])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11681])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#4387])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#4387])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#8437])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][124] -> [ABORT][125] ([i915#12061]) +1 other test abort
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][126] ([i915#9311]) +1 other test dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [PASS][127] -> [ABORT][128] ([i915#13010]) +1 other test abort
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@i915_selftest@mock@sanitycheck.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@i915_selftest@mock@sanitycheck.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7707])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4212]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4212]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][133] ([i915#10991]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#9531])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#9531])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][136] -> [DMESG-WARN][137] ([i915#12964]) +57 other tests dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-4/igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][138] -> [FAIL][139] ([i915#5956]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5286]) +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3638]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3638]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#6187])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +119 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6095]) +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +64 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#12313])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#12313]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [PASS][153] -> [SKIP][154] +22 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#6095]) +108 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#12805]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#12805])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#12805])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#12805])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#12805])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#6095]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#6095]) +84 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#12313])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#12313])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#12313])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#3742])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4087]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#7828]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#7828]) +9 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7828]) +8 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#7828]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7828]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3116]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3299])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3116] / [i915#3299])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3299])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][179] ([i915#7173]) +1 other test timeout
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7116])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#6944] / [i915#7116] / [i915#7118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#6944])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#7118] / [i915#9424])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#7118] / [i915#9424])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-9/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3555]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3555]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3555] / [i915#8814])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3555]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#13049])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8814])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#13049]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#13049])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#13049])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][196] +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#4103]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#9809]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4103] / [i915#4213])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#9723])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#9723])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#1769] / [i915#3555] / [i915#3804])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3804])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#1257])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#8812])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840] / [i915#9159])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-9/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][213] -> [DMESG-FAIL][214] ([i915#12964]) +1 other test dmesg-fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3955])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3469])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9337])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#9337])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9934]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9934]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8381])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3637]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#9934]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][225] -> [FAIL][226] ([i915#2122])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [PASS][227] -> [FAIL][228] ([i915#2122]) +4 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#11989] / [i915#2122])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
    - shard-snb:          NOTRUN -> [FAIL][230] ([i915#2122]) +3 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][231] ([i915#11989]) +2 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][232] ([i915#2122]) +3 other tests fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-rkl:          [PASS][233] -> [FAIL][234] ([i915#11989] / [i915#2122])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_flip@plain-flip-ts-check.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [PASS][235] -> [FAIL][236] ([i915#2122]) +1 other test fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:
    - shard-rkl:          [PASS][237] -> [FAIL][238] ([i915#11989])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#2672])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#2587] / [i915#2672] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#2672] / [i915#8813]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8810] / [i915#8813])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8810])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555]) +5 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][252] -> [FAIL][253] ([i915#6880]) +1 other test fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [FAIL][254] ([i915#6880]) +1 other test fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#8708]) +10 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][256] +46 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-snb:          [PASS][257] -> [SKIP][258] +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][259] +49 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#5439])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#5439])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#5439]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#5354]) +21 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#8708]) +7 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#1825]) +17 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#3458]) +15 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#9766])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#3458]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#1825]) +27 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][270] +90 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#8708]) +25 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#3023]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#6118])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8228]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8228]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#12388])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#1839])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#6301]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#6301])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:
    - shard-tglu:         [PASS][282] -> [DMESG-WARN][283] ([i915#10354] / [i915#1982])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][284] ([i915#12178])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][285] ([i915#7862]) +1 other test fail
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][286] ([i915#12169]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][287] ([i915#12177])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][288] ([i915#10647]) +5 other tests fail
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#12247]) +8 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#12247]) +9 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#2575] / [i915#9423]) +6 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12247] / [i915#3555])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12247]) +7 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#12247] / [i915#6953])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#12247]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#12343])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#5354]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#3828])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#3828])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#8430])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [PASS][304] -> [SKIP][305] ([i915#12937]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@kms_pm_rpm@cursor-dpms.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12937]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#9519])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9519])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][310] -> [SKIP][311] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#6524])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#6524])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#11520]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][315] ([i915#11520]) +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#11520]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][317] ([i915#11520]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#9808]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#11520]) +12 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12316]) +8 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#11520]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#9683])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9683])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#1072] / [i915#9732]) +9 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#1072] / [i915#9732]) +14 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_psr@fbc-psr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#9688]) +17 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][327] +277 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +22 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#9732]) +27 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt@edp-1:
    - shard-mtlp:         [PASS][330] -> [FAIL][331] ([i915#10105])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-4/igt@kms_psr@psr2-sprite-blt@edp-1.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_psr@psr2-sprite-blt@edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#9685])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#12755])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][334] ([i915#12231]) +1 other test abort
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-3/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#2575]) +56 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][336] ([i915#12276])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][337] ([i915#10056] / [i915#12276])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#3555] / [i915#9906])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#9906])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#9906])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#9906]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#8808] / [i915#9906])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-glk:          NOTRUN -> [SKIP][343] ([i915#2437])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-glk4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#2437])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#2437] / [i915#9412])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#12506]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          [PASS][347] -> [SKIP][348] ([i915#12506]) +9 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-6/igt@perf@low-oa-exponent-permissions.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][349] ([i915#9100])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-hang@vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][350] ([i915#4349]) +3 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@perf_pmu@busy-hang@vcs1.html
    - shard-dg2:          NOTRUN -> [FAIL][351] ([i915#4349])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-1/igt@perf_pmu@busy-hang@vcs1.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][352] ([i915#11823])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#8516])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-3/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_busy@before:
    - shard-dg2:          [PASS][354] -> [SKIP][355] ([i915#2575]) +156 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@prime_busy@before.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@prime_busy@before.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#3708]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#3708])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#9917])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9917]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][360] ([i915#12910])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][361] ([i915#12964]) +4 other tests dmesg-warn
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][362] ([i915#12817] / [i915#5507]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][364] ([i915#2582]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@fbdev@nullptr.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@fbdev@nullptr.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][366] ([i915#9561]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][368] ([i915#5784]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-14/igt@gem_eio@kms.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          [SKIP][370] ([i915#12936]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@gem_lmem_swapping@heavy-multi.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][372] ([i915#9820]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][374] ([i915#12817] / [i915#9820]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][376] ([i915#10131] / [i915#10887]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-rkl:          [SKIP][378] -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@i915_pm_rpm@gem-idle.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [FAIL][380] ([i915#12867]) -> [PASS][381] +4 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@i915_selftest@perf.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-7/igt@i915_selftest@perf.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [FAIL][382] ([i915#12518] / [i915#12766]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3:
    - shard-dg1:          [FAIL][384] ([i915#12518]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg1:          [INCOMPLETE][386] ([i915#12358]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-13/igt@kms_cursor_crc@cursor-suspend.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-17/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][388] ([i915#2122]) -> [PASS][389] +4 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-rkl:          [DMESG-WARN][390] ([i915#12917] / [i915#12964]) -> [PASS][391] +3 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-4/igt@kms_flip_tiling@flip-change-tiling.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][392] ([i915#6880]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][394] -> [PASS][395] +26 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [SKIP][396] ([i915#2575] / [i915#9423]) -> [PASS][397] +5 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][398] ([i915#9295]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-rkl:          [DMESG-FAIL][400] ([i915#12964]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_pm_rpm@basic-rte.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          [DMESG-WARN][402] ([i915#4423]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-12/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][404] ([i915#12937]) -> [PASS][405] +3 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][406] ([i915#9519]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_selftest@drm_format:
    - shard-rkl:          [DMESG-WARN][408] ([i915#12964]) -> [PASS][409] +50 other tests pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_selftest@drm_format.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-2/igt@kms_selftest@drm_format.html

  * igt@kms_vblank@ts-continuation-idle-hang:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [PASS][411] +163 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_vblank@ts-continuation-idle-hang.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@kms_vblank@ts-continuation-idle-hang.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [SKIP][412] ([i915#12506]) -> [PASS][413] +7 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-mtlp:         [FAIL][414] ([i915#4349]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-7/igt@perf_pmu@busy-idle@ccs0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-2/igt@perf_pmu@busy-idle@ccs0.html
    - shard-dg2:          [FAIL][416] ([i915#4349]) -> [PASS][417] +1 other test pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@perf_pmu@busy-idle@ccs0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-5/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@module-unload:
    - shard-snb:          [ABORT][418] ([i915#12450]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb4/igt@perf_pmu@module-unload.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb4/igt@perf_pmu@module-unload.html
    - shard-tglu:         [ABORT][420] ([i915#13010]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-8/igt@perf_pmu@module-unload.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-8/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][422] ([i915#8414]) -> [SKIP][423] ([i915#12506]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#3936])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_busy@semaphore.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-2/igt@gem_busy@semaphore.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          [SKIP][426] ([i915#8555]) -> [SKIP][427] ([i915#2575]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-8/igt@gem_ctx_persistence@hang.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [FAIL][428] ([i915#11980] / [i915#12580]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-6/igt@gem_ctx_persistence@hostile.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          [SKIP][430] ([i915#2575]) -> [SKIP][431] ([i915#5882])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][432] ([i915#280]) -> [SKIP][433] ([i915#2575]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#280]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][436] ([i915#5784]) -> [SKIP][437] ([i915#2575])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@gem_eio@kms.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_eio@kms.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#4812]) +2 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_exec_fence@submit3.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-6/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][440] ([i915#3539] / [i915#4852]) -> [SKIP][441] ([i915#2575])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@gem_exec_flush@basic-uc-pro-default.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#3539] / [i915#4852]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-3/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][444] ([i915#3539]) -> [SKIP][445] ([i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#3281]) +4 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-10/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          [SKIP][448] ([i915#3281]) -> [SKIP][449] ([i915#2575]) +7 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#4537] / [i915#4812])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          [SKIP][452] ([i915#4860]) -> [SKIP][453] ([i915#2575])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          [SKIP][454] ([i915#2575]) -> [SKIP][455] ([i915#4860])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fen

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/index.html
