Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053CDD5A6C6
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 02:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC1D10E181;
	Tue, 26 Nov 2024 02:19:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393F210E181;
 Tue, 26 Nov 2024 02:19:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fpm=5Fr?=
 =?utf-8?q?pm=3A_Update_cursor=5Ffb3_framebuffer_creation_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 02:19:27 -0000
Message-ID: <173258756724.3112864.2936783917521320276@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125171028.383914-1-jeevan.b@intel.com>
In-Reply-To: <20241125171028.383914-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer creation format
URL   : https://patchwork.freedesktop.org/series/141765/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15744_full -> IGTPW_12195_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12195_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12195_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (1): shard-dg2-9 
  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12195_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-3/igt@i915_suspend@basic-s2idle-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-1/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-gt0.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][11] ([i915#12964]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html

  
Known issues
------------

  Here are the changes found in IGTPW_12195_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@eof:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#2582])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@fbdev@eof.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [PASS][16] -> [SKIP][17] ([i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@fbdev@unaligned-write.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@fbdev@unaligned-write.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9323]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][24] ([i915#7297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][25] ([i915#12392] / [i915#7297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#9310])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-5/igt@gem_compute@compute-square.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#2575]) +65 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][29] ([i915#11980] / [i915#12580])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb2/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4771])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4036])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#4525])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][39] ([i915#11965] / [i915#12558]) +2 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#5107])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#5107])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4537] / [i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][50] +86 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb1/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][51] ([i915#12964]) +12 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4613]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [PASS][56] -> [SKIP][57] ([i915#12936]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@gem_lmem_swapping@massive.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#12193])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk4/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#12936]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4077]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@gem_mmap_gtt@isolation.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4083]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4083]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4083]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][75] ([i915#12964])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4270]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4270])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8428]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4077]) +15 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4879])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_unfence_active_buffers.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4879])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3282] / [i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#4958])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][91] -> [DMESG-FAIL][92] ([i915#12964]) +1 other test dmesg-fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][93] +13 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#2527] / [i915#2856]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#2856]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#6412])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#6412])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#6412])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8399])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][105] -> [INCOMPLETE][106] ([i915#12455]) +1 other test incomplete
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][107] -> [FAIL][108] ([i915#12942]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          [PASS][109] -> [SKIP][110] ([i915#13014]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@i915_pm_rpm@system-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#13014])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#11681] / [i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#11681])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4387])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4387])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#8437])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live:
    - shard-snb:          [PASS][117] -> [ABORT][118] ([i915#12450])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb2/igt@i915_selftest@live.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb4/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [PASS][119] -> [ABORT][120] ([i915#11703])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb2/igt@i915_selftest@live@sanitycheck.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb4/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][121] ([i915#9311]) +1 other test dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [PASS][123] -> [ABORT][124] ([i915#13010]) +3 other tests abort
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@i915_selftest@mock@sanitycheck.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][125] -> [INCOMPLETE][126] ([i915#4817])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#7707])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#7707])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4212]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#4212]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4212])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#8709]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#9531])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#9531])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         [PASS][135] -> [FAIL][136] ([i915#11808] / [i915#5956]) +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#5286]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5286]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#5286])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3638]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3638]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#5190]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#6187])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4538] / [i915#5190]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#6095]) +102 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6095]) +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +64 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#10307] / [i915#10434] / [i915#6095])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#12313]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [PASS][153] -> [SKIP][154] +20 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#6095]) +161 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#12805]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6095]) +95 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#12805])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#12805])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#12805])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#12805])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +15 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#12313]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#12313]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#12313]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#12313]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#6095]) +34 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#3742])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4087]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#7828]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7828]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#7828]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#7828]) +10 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#7828]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7828]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3116])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3116] / [i915#3299])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3299])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7116])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#6944] / [i915#7116] / [i915#7118])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-3/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6944])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3555]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8814])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3555]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3555])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#3555]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#8814])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#13049]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#13049]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][194] -> [DMESG-WARN][195] ([i915#12964]) +45 other tests dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [PASS][196] -> [DMESG-WARN][197] ([i915#12917] / [i915#12964])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#13049])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13049])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][200] ([i915#12917] / [i915#12964])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][201] +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#4103] / [i915#4213]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#4103]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#9809]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][205] -> [FAIL][206] ([i915#2346])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#9723])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#9723])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3804])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#1257])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#8812])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-1/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840] / [i915#9159])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3840])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#3840]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3555] / [i915#3840]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#3840] / [i915#9053])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglu:         [PASS][220] -> [FAIL][221] ([i915#4767])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3955])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3469])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#2065] / [i915#4854])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#9337])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#9337])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#9337])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9934]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#3637]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9934]) +5 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#8381])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3637]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#3637]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#9934]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][235] -> [FAIL][236] ([i915#2122]) +5 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#2672])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#2672] / [i915#8813]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8810] / [i915#8813])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8810])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][252] +42 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#8708]) +7 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5354]) +24 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][255] +50 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-snb:          [PASS][256] -> [SKIP][257] +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] +33 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#5439])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#5439])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#5439]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#10433] / [i915#3458])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3458]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#8708]) +8 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#1825]) +18 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9766])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#1825]) +27 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][268] +95 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8708]) +29 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#3458]) +22 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3023]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [PASS][272] -> [SKIP][273] ([i915#2575]) +163 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@kms_getfb@getfb-handle-closed.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#6118])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-9/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8228])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8228])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8228]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#12388])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#10656])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#12388])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#1839])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#6301])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#6301])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#6301])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][286] ([i915#12177])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][287] ([i915#10647]) +1 other test fail
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#12247]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12247]) +9 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#2575] / [i915#9423])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][292] ([i915#4423])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][293] +200 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#12247] / [i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#12247]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][296] -> [SKIP][297] ([i915#2575] / [i915#9423]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#6953])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#12247]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#12247] / [i915#6953])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#12247]) +7 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9812])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#5354])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#3828])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#3828])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#8430])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [PASS][307] -> [SKIP][308] ([i915#12937]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@kms_pm_rpm@cursor-dpms.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9519]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#9519]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9519])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][313] -> [SKIP][314] ([i915#9519])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#6524] / [i915#6805])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#6524])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#6524])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#6524])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#6524])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#11520]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#11520]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][322] ([i915#11520]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#9808]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#11520]) +10 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12316]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#11520]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#11520]) +7 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][328] ([i915#11520]) +7 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#9683])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9683])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#1072] / [i915#9732]) +9 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#9688]) +21 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-4/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#1072] / [i915#9732]) +13 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@kms_psr@fbc-psr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#1072] / [i915#9732]) +29 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#9732]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#9732]) +21 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9685])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#5289])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#5289]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#12755])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][341] ([i915#12231]) +1 other test abort
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][342] ([IGT#160] / [i915#6493])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#8623])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#9906])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#9906])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#3555] / [i915#9906])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-18/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9906])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9906]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9906])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#8808] / [i915#9906])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#2437] / [i915#9412]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-14/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#2437] / [i915#9412])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-glk1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#2437] / [i915#9412])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-tglu-1:       [PASS][355] -> [FAIL][356] ([i915#10538])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html
    - shard-mtlp:         [PASS][357] -> [FAIL][358] ([i915#10538]) +2 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-6/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#12506]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          [PASS][360] -> [SKIP][361] ([i915#12506]) +9 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-6/igt@perf@low-oa-exponent-permissions.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][362] ([i915#9100])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][363] ([i915#4349]) +2 other tests fail
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][364] ([i915#4349]) +4 other tests fail
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [ABORT][365] ([i915#13010])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-1/igt@perf_pmu@module-unload.html
    - shard-dg2:          NOTRUN -> [FAIL][366] ([i915#11823])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][367] -> [FAIL][368] ([i915#11943] / [i915#12515]) +1 other test fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@perf_pmu@most-busy-idle-check-all.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [PASS][369] -> [FAIL][370] ([i915#11943]) +1 other test fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [PASS][371] -> [FAIL][372] ([i915#11943] / [i915#12515]) +1 other test fail
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#8516])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][374] ([i915#9351])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#3708])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#3708]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#3708]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-3/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#9917])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][379] -> [FAIL][380] ([i915#12875])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-10/igt@tools_test@tools_test.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][381] ([i915#12817] / [i915#5507]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][383] ([i915#2582]) -> [PASS][384] +1 other test pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@fbdev@nullptr.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@fbdev@nullptr.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][385] ([i915#9561]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-7/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][387] ([i915#5784]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@gem_eio@kms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@gem_eio@kms.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-dg2:          [SKIP][389] ([i915#12936]) -> [PASS][390] +1 other test pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_lmem_swapping@heavy-random.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][391] ([i915#5493]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][393] -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-rkl:          [SKIP][395] -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@i915_pm_rpm@gem-idle.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-1/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [FAIL][397] ([i915#12867]) -> [PASS][398] +4 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@i915_selftest@perf.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [DMESG-WARN][399] ([i915#12917] / [i915#12964]) -> [PASS][400] +2 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-3/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [FAIL][401] ([i915#12518] / [i915#12766]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][403] ([i915#3555]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-8/igt@kms_color@deep-color.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@kms_color@deep-color.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][405] ([i915#2122]) -> [PASS][406] +5 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][407] ([i915#6880]) -> [PASS][408] +1 other test pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][409] -> [PASS][410] +21 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][411] ([i915#3555] / [i915#8228]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-dg1:          [DMESG-WARN][413] ([i915#4423]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg1-12/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg1-17/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [SKIP][415] ([i915#2575] / [i915#9423]) -> [PASS][416] +3 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][417] ([i915#9295]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][419] ([i915#12937]) -> [PASS][420] +5 other tests pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-rkl:          [DMESG-FAIL][421] ([i915#12964]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_pm_rpm@basic-rte.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-2/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2:
    - shard-rkl:          [DMESG-WARN][423] ([i915#12964]) -> [PASS][424] +51 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-3/igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-rkl-5/igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2.html

  * igt@kms_vblank@ts-continuation-idle-hang:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [PASS][426] +163 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@kms_vblank@ts-continuation-idle-hang.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-3/igt@kms_vblank@ts-continuation-idle-hang.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [SKIP][427] ([i915#12506]) -> [PASS][428] +12 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-mtlp:         [FAIL][429] ([i915#4349]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-7/igt@perf_pmu@busy-idle@ccs0.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-mtlp-2/igt@perf_pmu@busy-idle@ccs0.html
    - shard-dg2:          [FAIL][431] ([i915#4349]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-1/igt@perf_pmu@busy-idle@ccs0.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-8/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@module-unload:
    - shard-snb:          [ABORT][433] ([i915#12450]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb4/igt@perf_pmu@module-unload.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-snb4/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [SKIP][435] -> [SKIP][436] ([i915#11078])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@device_reset@cold-reset-bound.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          [SKIP][437] ([i915#8414]) -> [SKIP][438] ([i915#12506]) +2 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-7/igt@drm_fdinfo@isolation.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@drm_fdinfo@isolation.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][439] ([i915#2575]) -> [SKIP][440] ([i915#3936])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_busy@semaphore.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-10/igt@gem_busy@semaphore.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          [SKIP][441] ([i915#8555]) -> [SKIP][442] ([i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-8/igt@gem_ctx_persistence@hang.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][443] ([i915#2575]) -> [SKIP][444] ([i915#280])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [ABORT][446] ([i915#10030] / [i915#7975] / [i915#8213])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_eio@hibernate.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-4/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][447] ([i915#4812]) -> [SKIP][448] ([i915#2575]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          [SKIP][449] ([i915#2575]) -> [SKIP][450] ([i915#4812]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-11/igt@gem_exec_fence@submit3.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/shard-dg2-2/igt@gem_exec_fence@submit3.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12195/index.html
