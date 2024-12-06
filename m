Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27360E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 15:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BA810F12B;
	Fri,  6 Dec 2024 15:18:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862F710F119;
 Fri,  6 Dec 2024 15:18:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/intel=5Fcompute*=3AG?=
 =?utf-8?q?PGPU_support_for_MTL_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 15:18:13 -0000
Message-ID: <173349829354.3357417.788561502438462510@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206133821.29704-1-nishit.sharma@intel.com>
In-Reply-To: <20241206133821.29704-1-nishit.sharma@intel.com>
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

Series: lib/intel_compute*:GPGPU support for MTL platform
URL   : https://patchwork.freedesktop.org/series/142229/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15800_full -> IGTPW_12268_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12268_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12268_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12268_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15800_full and IGTPW_12268_full:

### New IGT tests (8) ###

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_async_flips@test-cursor-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12268_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@isolation:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][10] ([i915#12917] / [i915#12964])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_basic@multigpu-create-close.html
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb7/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@nohangcheck:
    - shard-tglu:         NOTRUN -> [ABORT][24] ([i915#13218]) +25 other tests abort
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@gem_exec_balancer@nohangcheck.html
    - shard-glk:          NOTRUN -> [ABORT][25] ([i915#13218]) +27 other tests abort
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk2/igt@gem_exec_balancer@nohangcheck.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#4525]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#4525]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@pi:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][28] ([i915#12964]) +3 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_exec_capture@pi.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3539])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539] / [i915#4852])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_gttfill@all-engines:
    - shard-rkl:          [PASS][35] -> [DMESG-WARN][36] ([i915#12964])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-rkl-7/igt@gem_exec_gttfill@all-engines.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_exec_gttfill@all-engines.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][37] +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281]) +10 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#3281]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3281]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4537] / [i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#7276])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][46] ([i915#7975] / [i915#8213]) +1 other test abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-snb:          NOTRUN -> [ABORT][47] ([i915#13242]) +9 other tests abort
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb2/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4860]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4860])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#2190])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_huc_copy@huc-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#2190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#2190])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#4613]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@gem_lmem_swapping@verify-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#12193])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4565])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4077]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4077]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@gem_mmap_gtt@pf-nonblock.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4083]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4083]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4083])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3282]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb4/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@gem_pxp@create-regular-context-2.html
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][75] ([i915#12917] / [i915#12964]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3282]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#5190] / [i915#8428]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#8411])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4079]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][83] ([i915#13263])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4880]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#4880])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][89] +463 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb4/igt@gem_vm_create@invalid-create.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][90] +21 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-10/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#2856]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@gen9_exec_parse@bb-large.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#2527]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#8399])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#8399])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#6590]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#6590]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#6590]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#6590]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rps@engine-order:
    - shard-dg1:          NOTRUN -> [ABORT][103] ([i915#13218]) +23 other tests abort
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4387])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#4387])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4387])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#4387])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-3/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#8437])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#6245])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#6245])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#6245])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][112] ([i915#9311]) +1 other test dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#7707])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@intel_hwmon@hwmon-write.html
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4212]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4212]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-8/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4212]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#10333])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5286]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#5286])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5286]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538] / [i915#5286]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5286]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#3638]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5190]) +9 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#6187])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][128] +22 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#12313])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#12313])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#12313])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#12313])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#12313])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10307] / [i915#6095]) +44 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#6095]) +53 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6095]) +39 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#6095]) +19 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6095]) +49 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#12805])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#12805])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#12805])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#12805])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#6095]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#6095]) +44 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][146] ([i915#12796])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7828]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#7828]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#7828]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#7828]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#7828]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#7828]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#7162] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#7116] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#3555] / [i915#6944] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3555] / [i915#8814]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#3555])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#13049]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#13049]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#13049])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#13049]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#13049]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#8814]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#9809]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3555]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_display_modes@extended-mode-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8827])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3840] / [i915#9688])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3840])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3840])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3840] / [i915#9688])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3955])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#3469])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#3637]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3637]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#9934]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#3637])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#9934]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9934]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#8810] / [i915#8813])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#8810])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672] / [i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672] / [i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#2587] / [i915#2672]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#2672]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#2672] / [i915#3555]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#2587] / [i915#2672])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#2672] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#2672] / [i915#8813])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#2672]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2587] / [i915#2672]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555] / [i915#8813]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#1825]) +24 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#1825]) +20 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8708]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#8708]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] +27 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][204] +31 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5354]) +21 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#10055])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#8708]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3458]) +14 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3023]) +18 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3458]) +15 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][211] +60 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#3555] / [i915#8228]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_hdr@bpc-switch.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#8228]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8228])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3555] / [i915#8228])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#12388])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#12388])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#12388])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-tglu:         NOTRUN -> [ABORT][221] ([i915#10159] / [i915#12817] / [i915#13218]) +1 other test abort
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][222] ([i915#13026]) +1 other test incomplete
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-mtlp:         NOTRUN -> [ABORT][223] ([i915#10159] / [i915#13218]) +1 other test abort
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3555]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@kms_plane_lowres@tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#11614] / [i915#3582]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#12247]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#12247] / [i915#9423])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#12247]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#12247] / [i915#6953] / [i915#9423])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#12247] / [i915#6953]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#12247] / [i915#6953]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#12247] / [i915#6953]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#12247]) +12 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#12247]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#12247] / [i915#6953])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#12247]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#12247]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#5354]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#9812])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9812])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-7/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#5354])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3828])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#3828])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3828])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#3828])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9519])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#9519])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-12/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9519])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#11520]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#11520]) +7 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#11520]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-glk:          NOTRUN -> [SKIP][254] ([i915#11520]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#11520]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#12316]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#11520]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#9808]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][259] ([i915#11520]) +13 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#4348])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9683])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#9683])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#9683])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9683])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9688]) +16 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +16 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_psr@fbc-psr2-primary-blt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#9732]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#1072] / [i915#9732]) +11 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#9732]) +15 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#1072] / [i915#9732]) +13 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][271] +249 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#5289])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#5289])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#12755])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#12755]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12755] / [i915#5190])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#5289])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#3555]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#3555] / [i915#8809] / [i915#8823])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8809])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][281] ([i915#2437])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#2437] / [i915#9412])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#2437] / [i915#9412])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          NOTRUN -> [ABORT][284] ([i915#13218]) +24 other tests abort
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-3/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@frequency@gt0:
    - shard-mtlp:         NOTRUN -> [ABORT][285] ([i915#13218]) +28 other tests abort
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-tglu-1:       NOTRUN -> [ABORT][286] ([i915#13218]) +3 other tests abort
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][287] ([i915#13218]) +9 other tests abort
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-snb7/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          NOTRUN -> [ABORT][288] ([i915#13218]) +29 other tests abort
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@perf_pmu@semaphore-wait.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#3708] / [i915#4077])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#3708])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-4/igt@prime_vgem@basic-read.html
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#3291] / [i915#3708])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-11/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3291] / [i915#3708])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][293] ([i915#12910]) +8 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][294] ([i915#12910]) +8 other tests fail
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#4818])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#4818])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-dg2-7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-rkl:          [SKIP][297] -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-rkl:          [DMESG-WARN][299] ([i915#12964]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x256.html

  
#### Warnings ####

  * igt@i915_selftest@mock:
    - shard-glk:          [DMESG-WARN][301] ([i915#9311]) -> [DMESG-WARN][302] ([i915#1982] / [i915#9311])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-glk9/igt@i915_selftest@mock.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/shard-glk9/igt@i915_selftest@mock.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#13263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13263
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8827]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8827
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8141 -> IGTPW_12268
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15800: 2e90353f058f2487798ad9236f0926df4ea54f02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12268: 12268
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12268/index.html
