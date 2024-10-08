Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035A9CED25D
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 03:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2A10E178;
	Tue,  8 Oct 2024 03:28:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840AE10E178;
 Tue,  8 Oct 2024 03:28:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4534301706283779358=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_runner/executor=2Ec=3A_Dete?=
 =?utf-8?q?ct_tests_killed_by_a_signal_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Oct 2024 03:28:02 -0000
Message-ID: <172835808252.1201485.11982706044529261063@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
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

--===============4534301706283779358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/executor.c: Detect tests killed by a signal (rev6)
URL   : https://patchwork.freedesktop.org/series/137879/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15481_full -> IGTPW_11864_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11864_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11864_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/index.html

Participating hosts (8 -> 8)
------------------------------

  Additional (1): shard-tglu-1 
  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11864_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +3 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_selftest@live:
    - shard-tglu:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-10/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_timelines:
    - shard-snb:          NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-dg1:          NOTRUN -> [ABORT][6] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:
    - shard-dg2:          [PASS][7] -> [ABORT][8] +5 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-mtlp:         [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_flip@2x-flip-vs-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg1:          [PASS][13] -> [ABORT][14] +3 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_rotation_crc@multiplane-rotation.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-rkl:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@runner@aborted:
    - shard-dg1:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@runner@aborted.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][18] ([i915#5784]) -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@gem_eio@kms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_eio@kms.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          [SKIP][20] -> [ABORT][21] +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_11864_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#6230])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#6230])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6230])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#8411]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8411])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8414])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8414])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][31] -> [SKIP][32] ([i915#2582])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@fbdev@pan.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@fbdev@pan.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#2582])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@fbdev@unaligned-read.html

  * igt@gem_busy@close-race:
    - shard-rkl:          NOTRUN -> [FAIL][34] ([i915#12297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@gem_busy@close-race.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4873])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@gem_caching@read-writes.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][36] +14 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_exec_fair@basic-none-rrul.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_exec_fair@basic-none-rrul.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4473] / [i915#4771])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-rkl:          NOTRUN -> [FAIL][42] ([i915#2842]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][43] ([i915#2842]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@gem_exec_fence@submit3.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#12193])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4565])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4083])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4270]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4270])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4270])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4270])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@new-obj:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4885])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4885])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4885])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_tiling_max_stride.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4077]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3297])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#2856]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gen9_exec_parse@allowed-single.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#2527]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#2527]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#2527] / [i915#2856]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][86] ([i915#9820])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][87] ([i915#9820])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#6412])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#7178])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#6412])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#6412])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#11681])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@i915_pm_rps@thresholds.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][93] -> [SKIP][94] ([i915#7984])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@i915_power@sanity.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#6245])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#6245])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@i915_query@hwconfig_table.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#7707])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#5286]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#5286]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4538] / [i915#5286]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][101] -> [FAIL][102] ([i915#5138])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3638]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#5190]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5190]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#5190] / [i915#9197])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][108] +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#6095]) +93 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#10307] / [i915#6095]) +139 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#12313])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#12313])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#12313])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#12313])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#12313])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6095]) +24 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#10307] / [i915#10434] / [i915#6095])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#6095]) +61 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6095]) +19 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3742])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3742])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4087]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#7828]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#7828]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#7828]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#7828]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#7828]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#3555]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#3116] / [i915#3299]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#3299])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3116])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3299])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#3299])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#11453])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#11453])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#11453])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#11453])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#11453])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#9809]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-snb:          [PASS][140] -> [SKIP][141] +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#4103])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#4213])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#4103])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4103] / [i915#4213])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#9723])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#9723])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#9833])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3555]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#8812])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#8812])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#9197]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3555] / [i915#3840])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3840] / [i915#9053])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3955])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#2065] / [i915#4854])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#1839])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#1839])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3637] / [i915#3966])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][160] -> [DMESG-WARN][161] ([i915#11922])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][162] +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3637])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9934]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3637])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][166] -> [FAIL][167] ([i915#2122]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [PASS][168] -> [SKIP][169] ([i915#5354]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_flip@flip-vs-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [PASS][170] -> [SKIP][171] ([i915#3555]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#2672] / [i915#3555]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#2672] / [i915#3555])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#2672]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#2587] / [i915#2672])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#2672] / [i915#3555]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#2672]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#2587] / [i915#2672]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#2672] / [i915#3555]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5274])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5354]) +21 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3023]) +18 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][183] +21 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#1825]) +19 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#8708]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#1825]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3458]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#10055])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#10055])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][190] +45 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#8708]) +8 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3458]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#8708]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8228]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8228])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8228])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][197] -> [SKIP][198] ([i915#10656])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#10656])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#4816])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#6301])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#6301])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#6301])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#6301])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2:          [PASS][205] -> [SKIP][206] ([i915#8825]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_plane@plane-position-hole-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#5354] / [i915#9423])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#6953])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          [PASS][209] -> [SKIP][210] ([i915#12247] / [i915#8152] / [i915#9423]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          [PASS][211] -> [SKIP][212] ([i915#12247] / [i915#8152]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - shard-dg2:          [PASS][213] -> [SKIP][214] ([i915#12247]) +11 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][215] -> [SKIP][216] ([i915#3555] / [i915#8152] / [i915#9423])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [PASS][217] -> [SKIP][218] ([i915#8152])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#12247]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#12247]) +14 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#12247] / [i915#9423])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#12247]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#12247]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [PASS][224] -> [SKIP][225] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][226] +49 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#5354]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#9812]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#5354])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3361])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][231] -> [SKIP][232] ([i915#9519])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][233] -> [SKIP][234] ([i915#9519]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg1:          [PASS][235] -> [DMESG-WARN][236] ([i915#4423])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#6524] / [i915#6805])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][238] ([i915#11520])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#9808])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#11520]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#11520]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#11520]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#11520])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#9683])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#9688]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#1072] / [i915#9732]) +9 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_psr@psr-cursor-render.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#1072] / [i915#9732]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9732]) +12 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#1072] / [i915#9732]) +15 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#9685])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#5289])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#11131] / [i915#5190]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#5289])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#5289])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3555]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][256] ([i915#12231]) +1 other test abort
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][257] ([i915#12231]) +1 other test abort
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][258] ([i915#12231]) +1 other test abort
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][259] -> [FAIL][260] ([i915#5465]) +2 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          [PASS][261] -> [FAIL][262] ([i915#5465]) +2 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#3555]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8809])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][265] ([IGT#2])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][266] ([IGT#2] / [i915#6493])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#8623])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#8623])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#8623])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#8623])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8623])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][272] -> [FAIL][273] ([i915#9196]) +1 other test fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [PASS][274] -> [SKIP][275] ([i915#9197]) +25 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_vblank@ts-continuation-modeset.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#8808] / [i915#9906])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#9906])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#11920])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#11920])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#2437] / [i915#9412])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#2437] / [i915#9412])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf_pmu@rc6:
    - shard-rkl:          [PASS][282] -> [ABORT][283] ([i915#9853]) +1 other test abort
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@perf_pmu@rc6.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@perf_pmu@rc6.html
    - shard-dg1:          [PASS][284] -> [ABORT][285] ([i915#9853]) +1 other test abort
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@perf_pmu@rc6.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@perf_pmu@rc6.html
    - shard-tglu:         [PASS][286] -> [ABORT][287] ([i915#9853]) +1 other test abort
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-9/igt@perf_pmu@rc6.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@perf_pmu@rc6.html
    - shard-dg2:          [PASS][288] -> [ABORT][289] ([i915#9853]) +1 other test abort
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@perf_pmu@rc6.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#8516])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#8516])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-snb:          [PASS][292] -> [ABORT][293] ([i915#9853]) +1 other test abort
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb5/igt@perf_pmu@rc6-suspend.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb1/igt@perf_pmu@rc6-suspend.html
    - shard-mtlp:         [PASS][294] -> [ABORT][295] ([i915#9853]) +5 other tests abort
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@semaphore-busy:
    - shard-mtlp:         [PASS][296] -> [FAIL][297] ([i915#4349]) +1 other test fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-7/igt@perf_pmu@semaphore-busy.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@perf_pmu@semaphore-busy.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][298] -> [FAIL][299] ([i915#4349]) +3 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [PASS][300] -> [FAIL][301] ([i915#4349]) +5 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3708])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3291] / [i915#3708])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][304] ([i915#2582]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@fbdev@nullptr.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@fbdev@nullptr.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          [FAIL][306] ([i915#11980]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-5/igt@gem_ctx_persistence@hostile.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@nop:
    - shard-mtlp:         [DMESG-WARN][308] -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@gem_exec_balancer@nop.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][310] ([i915#2846]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][312] ([i915#7975] / [i915#8213]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [INCOMPLETE][314] -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [ABORT][316] ([i915#11703]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb1/igt@i915_selftest@live@sanitycheck.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-dg2:          [SKIP][318] ([i915#9197]) -> [PASS][319] +37 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-dg1:          [DMESG-WARN][320] ([i915#4423]) -> [PASS][321] +3 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [FAIL][322] ([i915#2122]) -> [PASS][323] +9 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-mtlp:         [FAIL][324] -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [INCOMPLETE][326] ([i915#4839] / [i915#6113]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-mtlp:         [INCOMPLETE][328] ([i915#6113]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2:          [INCOMPLETE][330] ([i915#4839] / [i915#6113]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-edp1:
    - shard-mtlp:         [INCOMPLETE][332] ([i915#10056] / [i915#6113]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
    - shard-dg1:          [FAIL][334] ([i915#2122]) -> [PASS][335] +3 other tests pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-tglu:         [FAIL][336] ([i915#2122]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [SKIP][338] ([i915#3555]) -> [PASS][339] +4 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][340] ([i915#5354]) -> [PASS][341] +15 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-dg2:          [SKIP][342] ([i915#7294]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-dg2:          [SKIP][344] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][346] ([i915#12247] / [i915#8152]) -> [PASS][347] +2 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [SKIP][348] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][349] +1 other test pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [SKIP][350] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - shard-dg2:          [SKIP][352] ([i915#8152]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-dg2:          [SKIP][354] ([i915#12247]) -> [PASS][355] +11 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][356] ([i915#9340]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          [SKIP][358] ([i915#9340]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [SKIP][360] ([i915#1849]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][362] ([i915#9519]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][364] ([i915#9519]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [SKIP][366] ([i915#3547]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg2:          [FAIL][368] ([i915#4349]) -> [PASS][369] +5 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@perf_pmu@busy-idle@vcs0.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@perf_pmu@busy-idle@vcs0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [SKIP][370] -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         [FAIL][372] ([i915#12027]) -> [FAIL][373] ([i915#12031])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-6/igt@gem_ctx_engines@invalid-engines.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][374] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][375] ([i915#10131] / [i915#9820])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][376] ([i915#9531]) -> [SKIP][377] ([i915#9197])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][378] ([i915#9197]) -> [SKIP][379] ([i915#1769] / [i915#3555])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][380] ([i915#9197]) -> [SKIP][381] +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          [SKIP][382] -> [SKIP][383] ([i915#9197]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][384] ([i915#5190] / [i915#9197]) -> [SKIP][385] ([i915#4538] / [i915#5190]) +6 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][386] ([i915#4538] / [i915#5190]) -> [SKIP][387] ([i915#5190] / [i915#9197]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][388] ([i915#9197]) -> [SKIP][389] ([i915#10307] / [i915#6095]) +7 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][390] ([i915#9197]) -> [SKIP][391] ([i915#12313])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][392] ([i915#10307] / [i915#6095]) -> [SKIP][393] ([i915#9197]) +9 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][394] ([i915#4423] / [i915#6095]) -> [SKIP][395] ([i915#6095]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg1:          [SKIP][396] ([i915#6095]) -> [INCOMPLETE][397] ([i915#2295])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          [SKIP][398] ([i915#11616] / [i915#7213]) -> [SKIP][399] ([i915#9197])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_cdclk@mode-transition.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][400] ([i915#3299]) -> [SKIP][401] ([i915#9197])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          [SKIP][402] ([i915#9424]) -> [SKIP][403] ([i915#9197])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_content_protection@lic-type-1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][404] ([i915#9424]) -> [SKIP][405] ([i915#9433])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-18/igt@kms_content_protection@mei-interface.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][406] ([i915#7118] / [i915#7162] / [i915#9424]) -> [SKIP][407] ([i915#7118] / [i915#9424])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_content_protection@type1.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][408] ([i915#9197]) -> [SKIP][409] ([i915#11453])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          [SKIP][410] ([i915#9197]) -> [SKIP][411] ([i915#3555]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          [SKIP][412] ([i915#9197]) -> [SKIP][413] ([i915#5354])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          [SKIP][414] ([i915#5354]) -> [SKIP][415] ([i915#9197]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][416] ([i915#9197]) -> [SKIP][417] ([i915#4103] / [i915#4213])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][418] ([i915#9197]) -> [SKIP][419] ([i915#8812])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          [SKIP][420] ([i915#9197]) -> [SKIP][421] ([i915#3555] / [i915#3840]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][422] ([i915#3840] / [i915#9053]) -> [SKIP][423] ([i915#9197])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          [SKIP][424] ([i915#9197]) -> [SKIP][425] ([i915#4881])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_fence_pin_leak.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg1:          [SKIP][426] ([i915#2672] / [i915#3555] / [i915#4423]) -> [SKIP][427] ([i915#2672] / [i915#3555])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          [SKIP][428] ([i915#2587] / [i915#2672] / [i915#4423]) -> [SKIP][429] ([i915#2587] / [i915#2672])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          [SKIP][430] ([i915#3555] / [i915#5190]) -> [SKIP][431] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][432] ([i915#10433] / [i915#3458]) -> [SKIP][433] ([i915#5354])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][434] ([i915#8708]) -> [SKIP][435] ([i915#5354]) +10 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][436] ([i915#5354]) -> [SKIP][437] ([i915#8708]) +13 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][438] ([i915#5354]) -> [SKIP][439] ([i915#3458]) +10 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][440] ([i915#3458]) -> [SKIP][441] ([i915#10433] / [i915#3458]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][442] ([i915#10433] / [i915#3458]) -> [SKIP][443] ([i915#3458])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][444] ([i915#3458]) -> [SKIP][445] ([i915#5354]) +7 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [SKIP][446] ([i915#3555] / [i915#8228]) -> [SKIP][447] ([i915#9197])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][448] ([i915#9197]) -> [SKIP][449] ([i915#3555] / [i915#8228]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][450] ([i915#6301]) -> [SKIP][451] ([i915#9197])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][452] ([i915#9197]) -> [SKIP][453] ([i915#8821])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][454] ([i915#9197]) -> [SKIP][455] ([i915#3555] / [i915#8806])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [FAIL][456] ([i915#8292]) -> [SKIP][457] ([i915#6953])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          [FAIL][458] ([i915#8292]) -> [SKIP][459] ([i915#6953])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          [SKIP][460] ([i915#12247] / [i915#9423]) -> [SKIP][461] ([i915#12247] / [i915#8152] / [i915#9423])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][462] ([i915#12247]) -> [SKIP][463] ([i915#12247] / [i915#8152])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          [SKIP][464] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -> [SKIP][465] ([i915#12247] / [i915#6953] / [i915#9423])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [SKIP][466] ([i915#12247] / [i915#8152]) -> [SKIP][467] ([i915#12247])
   [466]: https://intel-gfx-ci.01.org/tree/drm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/index.html

--===============4534301706283779358==
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
<tr><td><b>Series:</b></td><td>runner/executor.c: Detect tests killed by a signal (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137879/">https://patchwork.freedesktop.org/series/137879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15481_full -&gt; IGTPW_11864_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11864_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11864_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>Additional (1): shard-tglu-1 <br />
  Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11864_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-10/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@i915_selftest@live@gt_timelines.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d.html">ABORT</a> +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_rotation_crc@multiplane-rotation.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_eio@kms.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11864_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@fbdev@pan.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@fbdev@unaligned-read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@gem_exec_fair@basic-none-share.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@gem_exec_reloc@basic-gtt-active.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#12193])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@gem_tiling_max_stride.html">SKIP</a> ([i915#4077])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@gem_tiling_max_stride.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@i915_pm_rps@thresholds.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190] / [i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4213])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#9197]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2065] / [i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#11922])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_flip@flip-vs-suspend.html">SKIP</a> ([i915#5354]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#5354]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#3023]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([i915#3458]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#10055])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#3458]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> ([i915#8825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([i915#5354] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> ([i915#12247]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> ([i915#9688]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_psr@psr-cursor-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_psr@psr-cursor-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_psr@psr-primary-render.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_psr@psr2-suspend.html">SKIP</a> ([i915#1072] / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#11131] / [i915#5190]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-16/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_vblank@ts-continuation-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html">SKIP</a> ([i915#9197]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@perf_pmu@rc6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@perf_pmu@rc6.html">ABORT</a> ([i915#9853]) +1 other test abort</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@perf_pmu@rc6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@perf_pmu@rc6.html">ABORT</a> ([i915#9853]) +1 other test abort</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-9/igt@perf_pmu@rc6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-6/igt@perf_pmu@rc6.html">ABORT</a> ([i915#9853]) +1 other test abort</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@perf_pmu@rc6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@perf_pmu@rc6.html">ABORT</a> ([i915#9853]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb5/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb1/igt@perf_pmu@rc6-suspend.html">ABORT</a> ([i915#9853]) +1 other test abort</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-1/igt@perf_pmu@rc6-suspend.html">ABORT</a> ([i915#9853]) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-7/igt@perf_pmu@semaphore-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@perf_pmu@semaphore-busy.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-5/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-4/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-2/igt@gem_exec_balancer@nop.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-3/igt@gem_exec_balancer@nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb1/igt@i915_selftest@live@sanitycheck.html">ABORT</a> ([i915#11703]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb6/igt@i915_selftest@live@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html">INCOMPLETE</a> ([i915#10056] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#3547]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@prime_mmap_kms@buffer-sharing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-tglu-6/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5190] / [i915#9197]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#9197]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#4423] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-15/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> ([i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#11616] / [i915#7213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> ([i915#3555] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#10433] / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#10433] / [i915#3458]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#10433] / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#5354]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> ([i915#12247] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15481/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11864/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; [SKIP][467] ([i915#12247])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4534301706283779358==--
