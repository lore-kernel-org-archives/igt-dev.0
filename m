Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85DC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 06:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4F810E44B;
	Tue, 30 Jul 2024 06:32:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBFB10E3DA;
 Tue, 30 Jul 2024 06:32:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6946758701377944990=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Fsysfs=5Fpr?=
 =?utf-8?q?eempt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 06:32:57 -0000
Message-ID: <172232117717.427271.14249070130853952935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729125847.3620366-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240729125847.3620366-1-nakshtra.goyal@intel.com>
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

--===============6946758701377944990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev2)
URL   : https://patchwork.freedesktop.org/series/136449/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15147_full -> IGTPW_11485_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11485_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11485_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11485_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-mtlp:         [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  
Known issues
------------

  Here are the changes found in IGTPW_11485_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#11078]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +8 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8562])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][14] -> [FAIL][15] ([i915#10086]) +5 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8555]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#4812])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#4036])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#4525]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][23] -> [FAIL][24] ([i915#2846])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][26] ([i915#2842]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4812]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#3281]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#3281]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3281]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#3281])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#7276])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4860]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4860]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-multi@lmem0:
    - shard-dg1:          [PASS][36] -> [FAIL][37] ([i915#10378])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@gem_lmem_swapping@heavy-multi@lmem0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_lmem_swapping@heavy-multi@lmem0.html

  * igt@gem_lmem_swapping@heavy-random@lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][38] ([i915#10378])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_lmem_swapping@heavy-random@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg2:          [PASS][40] -> [FAIL][41] ([i915#10378]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][43] ([i915#5493])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#284])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#284])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4077])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4083]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4083]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3282]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3282]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3282]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_pread@snoop.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#4270]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4270]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4270])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4270])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5190] / [i915#8428]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4079]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4079]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4885])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4077]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4879])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_unfence_active_buffers.html
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4879])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3297])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3297])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297] / [i915#4880])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3297]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-mtlp:         [PASS][68] -> [FAIL][69] ([i915#10177])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-6/igt@gem_workarounds@suspend-resume.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#2527] / [i915#2856])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#2527]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#2527]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][73] ([i915#9820])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#7091])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#8399])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#6621])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#8925]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4387])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#7984])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#5723])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4215] / [i915#5190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4212])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4212])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#8709]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#8709]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][86] ([i915#5956])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][87]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#5286]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#5286]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5286]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3638]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4538] / [i915#5190]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4538]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#10656])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#6095]) +91 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#6095]) +23 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#6095]) +47 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#6095]) +157 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3742]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3742])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#11616] / [i915#7213]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4087]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#7828])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#7828]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#7828]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#7828]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#9433])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#7118])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#7116])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#6944] / [i915#7116] / [i915#7118])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6944])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7118] / [i915#9424])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11453])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#11453])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3555]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#11453])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#11453]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#4103] / [i915#4213])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#4103])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-tglu:         [PASS][122] -> [DMESG-WARN][123] ([i915#10166] / [i915#1982])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-7/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#9723])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#3555]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#1257])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#8812])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#3555] / [i915#3840]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#3555] / [i915#3840]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3840] / [i915#9053])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4854])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#9337])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#9337])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#658])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#9934]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3637])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][137] +11 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][138] +28 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#8381])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#2672]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#2587] / [i915#2672]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][142] -> [FAIL][143] ([i915#6880])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][144] ([i915#6880])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#5354]) +27 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#1825])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5439])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#3458]) +13 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][149] +29 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#1825]) +43 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#5439])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9766])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#8708]) +20 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3458]) +12 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#8708])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#8708]) +14 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][157] +29 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3023]) +23 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3555] / [i915#8228])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3555] / [i915#8228]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#8228]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#4816])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6301])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#8821])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3555]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3555]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][167] ([i915#8292])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#9423]) +19 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#5176]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#9423]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#9423]) +11 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#5235]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#9728])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9728]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9728]) +7 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#5354])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#5354])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#9685])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#9685])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9685])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5978])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][182] -> [SKIP][183] ([i915#4281])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#9340])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9340])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#8430])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#9519])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][188] -> [SKIP][189] ([i915#9519])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][190] -> [SKIP][191] ([i915#9519]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#11520]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#11520]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#11520]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9683])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#9683])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#9732]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#1072] / [i915#9732]) +11 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#1072] / [i915#9732]) +18 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#1072] / [i915#9673] / [i915#9732]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#1072] / [i915#9732]) +23 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#9685])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#11131])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#5289])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#4235])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#11131] / [i915#5190])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#5289]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#9906])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#9906])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#2437] / [i915#9412])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#2437] / [i915#9412])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#7387]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#2434])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@perf@mi-rpc.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#8516])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#8516])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3708])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#3291] / [i915#3708])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3708])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@prime_vgem@basic-fence-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#3708])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3708] / [i915#4077]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#3291] / [i915#3708])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][222] ([i915#11713]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-8/igt@gem_exec_big@single.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@gem_exec_big@single.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [FAIL][224] ([i915#2842]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-mtlp:         [FAIL][226] ([i915#10177]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@gem_workarounds@suspend-resume-context.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][228] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][230] ([i915#3591]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][232] ([i915#7984]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-2/igt@i915_power@sanity.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][234] -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][236] ([i915#5138]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-rkl:          [ABORT][238] ([i915#10354]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-edp1:
    - shard-mtlp:         [FAIL][240] ([i915#10545]) -> [PASS][241] +3 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [FAIL][242] ([i915#6880]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][244] ([i915#9519]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-mtlp:         [FAIL][246] -> [PASS][247] +4 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@kms_psr@psr2-suspend@edp-1.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][248] ([i915#1982] / [i915#9559]) -> [ABORT][249] ([i915#9820])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         [SKIP][250] ([i915#6944] / [i915#9424]) -> [SKIP][251] ([i915#8063])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-9/igt@kms_content_protection@mei-interface.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][252] ([i915#3458]) -> [SKIP][253] ([i915#10433] / [i915#3458])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-dg2:          [SKIP][254] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][255] ([i915#1072] / [i915#9732]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-11/igt@kms_psr@fbc-pr-primary-render.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2:          [SKIP][256] ([i915#1072] / [i915#9732]) -> [SKIP][257] ([i915#1072] / [i915#9673] / [i915#9732]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-2/igt@kms_psr@fbc-psr-sprite-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10086]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10086
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
  [i915#10177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10177
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10545
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#5978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9559
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7940 -> IGTPW_11485
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15147: ec9c8ca911f54dec90f736f284b7128668deeb0d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11485: 9caebc564bb0ac76a0c60af12ff24c8094b51f0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/index.html

--===============6946758701377944990==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15147_full -&gt; IGTPW_11485_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11485_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11485_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11485_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11485_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10086">i915#10086</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@gem_lmem_swapping@heavy-multi@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_lmem_swapping@heavy-multi@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_lmem_swapping@heavy-random@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-6/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@gem_workarounds@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10177">i915#10177</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925">i915#8925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616">i915#11616</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-7/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166">i915#10166</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978">i915#5978</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-13/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-1/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-14/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-8/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@gem_workarounds@suspend-resume-context.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10177">i915#10177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-7/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-5/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354">i915#10354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10545">i915#10545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-mtlp-8/igt@kms_psr@psr2-suspend@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9559">i915#9559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-tglu-9/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-tglu-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063">i915#8063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-11/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-7/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15147/shard-dg2-2/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11485/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7940 -&gt; IGTPW_11485</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15147: ec9c8ca911f54dec90f736f284b7128668deeb0d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11485: 9caebc564bb0ac76a0c60af12ff24c8094b51f0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6946758701377944990==--
