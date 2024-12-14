Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FA9E7716A
	for <igt-dev@archiver.kernel.org>; Sat, 14 Dec 2024 07:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267D10E1A6;
	Sat, 14 Dec 2024 07:03:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD81E10E027;
 Sat, 14 Dec 2024 07:03:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fwedged?=
 =?utf-8?q?=3A_Add_AUX_error_to_ignore_list?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 14 Dec 2024 07:03:19 -0000
Message-ID: <173415979976.2417684.11668707738607821663@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213164105.14015-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241213164105.14015-1-jonathan.cavitt@intel.com>
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

Series: tests/intel/xe_wedged: Add AUX error to ignore list
URL   : https://patchwork.freedesktop.org/series/142575/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15843_full -> IGTPW_12316_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12316_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12316_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12316_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gem_eio@kms.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_async_flips@crc-atomic:
    - shard-snb:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb5/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][8] +2 other tests crash
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-mtlp:         [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-4/igt@perf_pmu@busy-hang@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@perf_pmu@busy-hang@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_12316_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#8411]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#6230])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][17] -> [ABORT][18] ([i915#5507])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +16 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@drm_fdinfo@isolation.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@gem_basic@multigpu-create-close.html
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#13008])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#13008])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#13008])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][29] -> [INCOMPLETE][30] ([i915#12392] / [i915#7297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#8562])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][37] ([i915#1099]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb1/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#280]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#280]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][41] -> [FAIL][42] ([i915#5784])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-10/igt@gem_eio@kms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][43] ([i915#12543] / [i915#5784])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4771]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4525]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#4525]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#4525])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3281]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3281]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +10 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4537])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-rkl:          [PASS][59] -> [DMESG-FAIL][60] ([i915#12964]) +2 other tests dmesg-fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@gem_exec_suspend@basic-s0@smem.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][61] -> [INCOMPLETE][62] ([i915#13196]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk5/igt@gem_exec_suspend@basic-s3@smem.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk3/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4860])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#4613]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#4613]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#284])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@gem_media_vme.html

  * igt@gem_mmap@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +14 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@gem_mmap_gtt@basic-read.html

  * igt@gem_mmap_gtt@close-race:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-5/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4083]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb1/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][78] ([i915#2658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][79] ([i915#2658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk6/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@gem_pread@self.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4270]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][84] ([i915#12917] / [i915#12964]) +1 other test timeout
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][85] ([i915#12964])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#8428]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190] / [i915#8428]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4079]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4077]) +14 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4079]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#3323])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3282] / [i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3297] / [i915#4880])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#3297]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][100] +421 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb1/igt@gem_vm_create@invalid-create.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#2856]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#2856])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][107] -> [ABORT][108] ([i915#9820])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][109] ([i915#9820])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#6412])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#8399])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          NOTRUN -> [FAIL][113] ([i915#12942]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][114] ([i915#3591]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][115] ([i915#12739] / [i915#3591]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#12797]) +1 other test incomplete
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#11681] / [i915#6621])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#11681] / [i915#6621])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#7984])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5723])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5723])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][122] -> [ABORT][123] ([i915#12061]) +1 other test abort
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][124] ([i915#9311]) +1 other test dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk7/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][125] ([i915#9311]) +1 other test dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][126] ([i915#9311])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         NOTRUN -> [ABORT][127] ([i915#13010])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][128] ([i915#7443])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][129] -> [INCOMPLETE][130] ([i915#4817])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk4/igt@i915_suspend@debugfs-reader.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk4/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][131] ([i915#4817])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk8/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4212])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg1:          [PASS][134] -> [FAIL][135] ([i915#13320]) +1 other test fail
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-14/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#8709]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#8709]) +23 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][138] ([i915#13287])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb5/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][139] ([i915#13287])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-6/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][140] ([i915#13287])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#12967] / [i915#6228])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#9531])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#1769] / [i915#3555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][144] ([i915#1769])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][145] ([i915#1769])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][146] -> [FAIL][147] ([i915#5956]) +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#5286]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#5286]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5286]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#5286]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3638])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][153] +11 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][154] +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4538] / [i915#5190]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4538]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#6095]) +173 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#6095]) +44 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#12313]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6095]) +14 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#10307] / [i915#6095]) +157 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#6095]) +87 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#12805])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#6095]) +19 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][166] ([i915#12964]) +10 other tests dmesg-warn
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6095]) +84 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#12313]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#12313]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7213]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3742])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7828]) +8 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7828]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#7828]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#7828]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7828]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7828]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#9979])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7116] / [i915#9424]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3116] / [i915#3299])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3116]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7118] / [i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#6944] / [i915#9424])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#7118])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6944] / [i915#7116] / [i915#7118])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#13049]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8814])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3555]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#13049])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#13049]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#13049]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#4213]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4103] / [i915#4213]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13046] / [i915#5354]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#9809]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][199] +12 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [PASS][200] -> [FAIL][201] ([i915#2346])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#9067])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9067])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#9723])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#8588])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#1769] / [i915#3555] / [i915#3804])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3804])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3804])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#3840]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#3840] / [i915#9053])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#3469])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#2065] / [i915#4854])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#1839])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#1839]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#3637])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3637]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9934]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#3637]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#8381])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#8381])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#4839])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9934]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9934]) +8 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#11989]) +3 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][235] -> [DMESG-WARN][236] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][237] -> [DMESG-WARN][238] ([i915#4423])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-14/igt@kms_flip@flip-vs-suspend.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][239] ([i915#12745] / [i915#4839]) +2 other tests incomplete
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][240] ([i915#12745]) +1 other test incomplete
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][241] ([i915#4423]) +1 other test dmesg-warn
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-mtlp:         [PASS][242] -> [FAIL][243] ([i915#11989]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-2/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#2587] / [i915#2672]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#2672]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672] / [i915#3555])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672] / [i915#3555])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#2672] / [i915#8813]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2672]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555] / [i915#5190])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [PASS][259] -> [FAIL][260] ([i915#6880])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][261] -> [SKIP][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] +43 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#8708]) +18 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][265] ([i915#10056])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#10433] / [i915#3458])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#5354]) +21 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][268] +38 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#5439])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#5439])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8708]) +18 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3458]) +11 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#1825]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#8708]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1825]) +36 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][276] +84 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#3023]) +24 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3458]) +13 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12713])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8228]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][284] -> [SKIP][285] ([i915#3555] / [i915#8228]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#10656])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#10656]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12394])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#12394])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#12339])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#10656])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#10656])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#10656])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#12388])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#12388])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#6301])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][298] ([i915#12177])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][299] ([i915#12169])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][300] ([i915#10647]) +3 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12247]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#12247]) +18 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3555]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12247] / [i915#6953])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#12247]) +18 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12247] / [i915#6953] / [i915#9423])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12247]) +7 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#12247] / [i915#3555] / [i915#6953])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#12247]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12247] / [i915#6953])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#12247] / [i915#3555] / [i915#9423])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#12247] / [i915#6953])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#12247]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#12343])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#12343])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12343])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#5354])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9812])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9685])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3828])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9685])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#9519])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][324] -> [SKIP][325] ([i915#9519]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#9519])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#12916])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#6524])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#6524] / [i915#6805])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#9808])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#11520]) +7 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][333] ([i915#11520]) +14 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#11520]) +9 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#11520]) +6 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#11520]) +11 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#12316]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][338] ([i915#11520]) +14 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#9683]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#9683])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#9688]) +8 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#1072] / [i915#9732]) +20 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-basic:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9732]) +21 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +16 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#9732]) +10 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][346] +512 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#1072] / [i915#9732]) +22 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-7/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#5289])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#5289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#12755] / [i915#5190])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#5289])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#5289])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#5289]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#12755])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#3555]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#3555]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][357] ([i915#13179]) +1 other test abort
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb7/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][358] ([i915#13179]) +1 other test abort
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#8623])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][360] ([i915#10959])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#8623])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#9906])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#11920])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#11920])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9906])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#9906])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#2437])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#2437] / [i915#9412])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#2437] / [i915#9412])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#2437])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][371] ([i915#2437]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#2437] / [i915#9412])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#2436])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#2434])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-18/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][375] -> [FAIL][376] ([i915#4349])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#8850])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][378] ([i915#12549] / [i915#6806]) +1 other test fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-2/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][379] ([i915#8516])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#8516])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_invalid_sync_flags:
    - shard-rkl:          [PASS][381] -> [DMESG-WARN][382] ([i915#12964]) +42 other tests dmesg-warn
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@prime_mmap@test_invalid_sync_flags.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@prime_mmap@test_invalid_sync_flags.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#3291] / [i915#3708])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#3708] / [i915#4077]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#3291] / [i915#3708])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#3708])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-7/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#9917])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][388] ([i915#12910]) +8 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-10/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#4818])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][390] ([i915#9561]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-5/igt@gem_ctx_freq@sysfs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-11/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][392] ([i915#12714] / [i915#5784]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-mtlp:         [ABORT][394] ([i915#13193]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-mtlp-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][396] ([i915#9820]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-dg2:          [FAIL][398] -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-7/igt@i915_pm_rps@reset.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-5/igt@i915_pm_rps@reset.html
    - shard-dg1:          [FAIL][400] -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-18/igt@i915_pm_rps@reset.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-13/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][402] ([i915#13010]) -> [PASS][403] +2 other tests pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-9/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [INCOMPLETE][404] ([i915#4817]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk4/igt@i915_suspend@basic-s3-without-i915.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [DMESG-WARN][406] ([i915#12964]) -> [PASS][407] +27 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-snb:          [INCOMPLETE][408] -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb4/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][410] ([i915#2346]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [FAIL][412] ([i915#2346]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [SKIP][414] ([i915#3555]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg1:          [DMESG-WARN][416] ([i915#4423]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-12/igt@kms_flip@dpms-vs-vblank-race.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg1-12/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-tglu:         [FAIL][418] ([i915#11989]) -> [PASS][419] +3 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [FAIL][420] ([i915#6880]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][422] -> [PASS][423] +4 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][424] ([i915#9519]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][426] ([i915#12916]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][428] ([i915#5465]) -> [PASS][429] +2 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-3/igt@kms_setmode@basic.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/shard-tglu-3/igt@kms_setmode@basic.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][430] ([i915#4349]) -> [PASS][431] +1 other test pass
   [4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12316/index.html
