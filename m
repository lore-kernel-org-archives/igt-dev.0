Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F41D5E120
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 03:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3179C10E25A;
	Fri,  8 Nov 2024 03:10:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1E310E25A;
 Fri,  8 Nov 2024 03:10:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4071717955818946357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_test/intel/xe=5Fsysfs=3A_Re?=
 =?utf-8?q?store_sysfs_params_correctly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Nov 2024 03:10:12 -0000
Message-ID: <173103541240.1425406.6271378774028419073@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241107225254.302010-1-jonathan.cavitt@intel.com>
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

--===============4071717955818946357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/intel/xe_sysfs: Restore sysfs params correctly
URL   : https://patchwork.freedesktop.org/series/141072/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15654_full -> IGTPW_12064_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12064_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12064_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/index.html

Participating hosts (9 -> 9)
------------------------------

  Additional (1): shard-glk-0 
  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12064_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-4.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [SKIP][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_rotation_crc@sprite-rotation-90:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90.html

  
Known issues
------------

  Here are the changes found in IGTPW_12064_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +26 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8414]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8414])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#4873])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-snb:          NOTRUN -> [SKIP][11] +149 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#6335])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          [PASS][17] -> [ABORT][18] ([i915#9846])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          [PASS][22] -> [FAIL][23] ([i915#11980] / [i915#12580])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][25] -> [FAIL][26] ([i915#12543] / [i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-18/igt@gem_eio@reset-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][27] -> [FAIL][28] ([i915#12714] / [i915#5784])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4812]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][32] ([i915#11713])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#6334]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#6344])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#2842]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_fair@basic-pace-share.html
    - shard-tglu:         [PASS][37] -> [FAIL][38] ([i915#2842]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-9/igt@gem_exec_fair@basic-pace-share.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglu:         NOTRUN -> [FAIL][39] ([i915#2842]) +9 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@gem_exec_fair@basic-pace@bcs0.html
    - shard-rkl:          [PASS][40] -> [FAIL][41] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-3/igt@gem_exec_fair@basic-pace@bcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4812]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4812]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#5107])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +15 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +14 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@pi-common@vcs0:
    - shard-rkl:          NOTRUN -> [FAIL][51] ([i915#12296]) +4 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_schedule@pi-common@vcs0.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][52] ([i915#12296]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4537] / [i915#4812])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4860]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#12193])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4565])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#4613])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4613]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4083]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_mmap_wc@fault-concurrent.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#5190] / [i915#8428]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4079])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#8411])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4079]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4079]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4077]) +14 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#3297] / [i915#3323])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4880]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#4880])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3297]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_userptr_blits@readonly-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][91] +9 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][92] +15 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#2527] / [i915#2856])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#2527]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#2527])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@gen9_exec_parse@bb-start-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#2856])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4881])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@i915_fb_tiling.html

  * igt@i915_module_load@load:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#6227])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          NOTRUN -> [ABORT][101] ([i915#9820])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6412])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][103] -> [FAIL][104] ([i915#3591]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][105] ([i915#8346])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#11681]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4387])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#4387])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4387])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#8437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#6245])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@i915_query@hwconfig_table.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#6245])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#6245])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][114] ([i915#9311]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@i915_selftest@mock.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#7707])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212] / [i915#5190])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#8709]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#5286]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#5286])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#5286]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#5286])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#3638])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#3638]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] +20 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5190]) +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][129] +21 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6187])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#12313]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#12313]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#6095]) +136 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#6095]) +91 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#10307] / [i915#6095]) +159 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#6095]) +14 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#12313])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#12313])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#12313])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6095]) +44 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#11616] / [i915#7213])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#7213]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#7828]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#7828]) +8 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7828]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#7828]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7828]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#7828]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3555]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7118] / [i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3116] / [i915#3299]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3116])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#7116] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][157] ([i915#7173])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6944] / [i915#7116] / [i915#7118])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#11453] / [i915#3359]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#11453] / [i915#3359])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#11453] / [i915#3359]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#11453] / [i915#3359]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#11453] / [i915#3359]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#3555]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#8814])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#8814]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3555]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#3555]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2:          [PASS][169] -> [INCOMPLETE][170] ([i915#12358] / [i915#7882])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#4103])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#4103] / [i915#4213])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [PASS][173] -> [FAIL][174] ([i915#2346])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#9067])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#9067])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#9067])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#9067])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#9067])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8588])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#8588])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#1769] / [i915#3555] / [i915#3804])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3804])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#12402])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3840])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#3555] / [i915#3840]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4854])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#1839])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#1839])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#1839])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#1839])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#1839]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#9337])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#658]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][197] -> [FAIL][198] ([i915#2122]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3637])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#8381]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8381]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#3637] / [i915#3966])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3637]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#9934]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3637]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3637] / [i915#3966])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2:          [PASS][207] -> [FAIL][208] ([i915#79])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-dg2:          NOTRUN -> [FAIL][209] ([i915#79])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#8381]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][211] -> [INCOMPLETE][212] ([i915#4839]) +1 other test incomplete
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [PASS][213] -> [FAIL][214] ([i915#2122]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#2672]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#2672] / [i915#8813]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#2672]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672] / [i915#3555])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672] / [i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5274])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#5354]) +54 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [PASS][230] -> [SKIP][231] +14 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#1825]) +22 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#3458]) +22 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8708]) +24 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][235] +44 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8708]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#1825]) +12 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3458]) +13 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#9766])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3023]) +13 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][241] +72 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8708]) +16 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#433])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#12713])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][246] -> [SKIP][247] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-10/igt@kms_hdr@static-swap.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#12394])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#10656])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#10656])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#12394])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#10656])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#4816])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#6301])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#12247]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#12247]) +14 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#12247] / [i915#9423])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#12247]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12247]) +11 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#12247] / [i915#6953])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#12247] / [i915#6953])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#12247]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#12504]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#12247] / [i915#6953])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#5354])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9812])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9685]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#9685]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9685]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#9292])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#10139])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][278] -> [SKIP][279] ([i915#9340])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#8430])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#8430])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#9519]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#9519])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#9519])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][286] -> [SKIP][287] ([i915#9519])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#6524] / [i915#6805])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#6524])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#11520]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#11520]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#11520]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#9808])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#11520]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#11520]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#12316]) +6 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#11520]) +11 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#9683]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#4348])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#9683])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#9683])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#9688]) +9 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#4423] / [i915#9732])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9732]) +16 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#9732]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +21 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#1072] / [i915#9732]) +19 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#1072] / [i915#9732]) +12 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#9685]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#5190]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#5289])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#3555]) +6 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-snb:          [PASS][313] -> [FAIL][314] ([i915#5465]) +2 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb5/igt@kms_setmode@basic.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_setmode@basic.html
    - shard-tglu:         [PASS][315] -> [FAIL][316] ([i915#5465]) +2 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-2/igt@kms_setmode@basic.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8809])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][318] ([i915#5465]) +3 other tests fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][319] ([i915#5465]) +2 other tests fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][320] ([i915#5465]) +2 other tests fail
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][321] ([IGT#2])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][322] ([IGT#2] / [i915#6493])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#8623])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#11920])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#11920])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#9906]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#9906]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#2437]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_writeback@writeback-check-output.html
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#2437])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_writeback@writeback-check-output.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#2437])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#2437])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_writeback@writeback-check-output.html
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#2437])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_writeback@writeback-check-output.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#3708]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#3708] / [i915#4077])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#3708]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3708] / [i915#4077])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#3708] / [i915#4077])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#3708])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#9917])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][341] ([i915#12564] / [i915#9781])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-rkl:          [FAIL][342] ([i915#2842]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_wait@write-busy:
    - shard-snb:          [INCOMPLETE][344] -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb2/igt@gem_wait@write-busy.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@gem_wait@write-busy.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][346] ([i915#9697]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][348] ([i915#9820]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][350] ([i915#12548] / [i915#3591]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [FAIL][352] ([i915#10991]) -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-snb:          [SKIP][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [FAIL][356] ([i915#2346]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [DMESG-WARN][358] -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][360] ([i915#11989] / [i915#2122]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
    - shard-mtlp:         [FAIL][362] ([i915#11989] / [i915#2122]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-mtlp:         [FAIL][364] ([i915#2122]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-mtlp:         [FAIL][366] ([i915#11989]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][368] ([i915#2122]) -> [PASS][369] +2 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-edp1:
    - shard-mtlp:         [INCOMPLETE][370] ([i915#6113]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-5/igt@kms_flip@flip-vs-suspend@b-edp1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@kms_flip@flip-vs-suspend@b-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][372] ([i915#2122]) -> [PASS][373] +4 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-dg2:          [FAIL][374] ([i915#2122]) -> [PASS][375] +2 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-11/igt@kms_flip@wf_vblank-ts-check.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check.html
    - shard-snb:          [FAIL][376] ([i915#10826] / [i915#2122]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_flip@wf_vblank-ts-check.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-vga1:
    - shard-snb:          [FAIL][378] ([i915#10826]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][380] ([i915#6880]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][382] ([i915#9519]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][384] ([i915#9519]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-mtlp:         [FAIL][386] ([i915#12432]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-plane-move@edp-1:
    - shard-mtlp:         [FAIL][388] ([i915#10105]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move@edp-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move@edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [INCOMPLETE][390] -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_vrr@negative-basic.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_vrr@negative-basic.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][392] ([i915#10131] / [i915#9820]) -> [ABORT][393] ([i915#10131] / [i915#10887] / [i915#9697])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg1:          [SKIP][394] ([i915#4423]) -> [SKIP][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg1:          [SKIP][396] ([i915#4423] / [i915#7828]) -> [SKIP][397] ([i915#7828])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          [SKIP][398] ([i915#7828]) -> [SKIP][399] ([i915#4423] / [i915#7828])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][400] ([i915#7118] / [i915#9424]) -> [TIMEOUT][401] ([i915#7173])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@kms_content_protection@legacy.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][402] ([i915#7118] / [i915#7162] / [i915#9424]) -> [SKIP][403] ([i915#7118] / [i915#9424])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-10/igt@kms_content_protection@type1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_content_protection@type1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [FAIL][404] ([i915#2122]) -> [FAIL][405] ([i915#10826]) +1 other test fail
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          [SKIP][406] ([i915#2672] / [i915#3555] / [i915#4423]) -> [SKIP][407] ([i915#2672] / [i915#3555])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          [SKIP][408] ([i915#2587] / [i915#2672] / [i915#4423]) -> [SKIP][409] ([i915#2587] / [i915#2672])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][410] ([i915#4423] / [i915#8708]) -> [SKIP][411] ([i915#8708])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][412] ([i915#3458]) -> [SKIP][413] ([i915#10433] / [i915#3458])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][414] ([i915#10433] / [i915#3458]) -> [SKIP][415] ([i915#3458]) +3 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          [SKIP][416] ([i915#12713]) -> [SKIP][417] ([i915#1187] / [i915#12713])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][418] ([i915#3828]) -> [SKIP][419] ([i915#9340])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-dg1:          [SKIP][420] ([i915#4077] / [i915#4423]) -> [SKIP][421] ([i915#4077])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_pm_rpm@pm-tiling.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          [SKIP][422] ([i915#11520]) -> [SKIP][423] ([i915#11520] / [i915#4423])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-dg1:          [SKIP][424] ([i915#1072] / [i915#9732]) -> [SKIP][425] ([i915#1072] / [i915#4423] / [i915#9732])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_psr@fbc-pr-primary-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_psr@fbc-pr-primary-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10105]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12296]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12432
  [i915#12504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12504
  [i915#12543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543
  [i915#12548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12548
  [i915#12564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12646
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/index.html

--===============4071717955818946357==
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
<tr><td><b>Series:</b></td><td>test/intel/xe_sysfs: Restore sysfs params correctly</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141072/">https://patchwork.freedesktop.org/series/141072/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15654_full -&gt; IGTPW_12064_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12064_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12064_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>Additional (1): shard-glk-0 <br />
  Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12064_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend@pipe-d-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_rotation_crc@sprite-rotation-90:<ul>
<li>{shard-dg2-9}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12064_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@gem_ctx_persistence@hostile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980">i915#11980</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580">i915#12580</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543">i915#12543</a> / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-19/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714">i915#12714</a> / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-9/igt@gem_exec_fair@basic-pace-share.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +9 other tests fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-3/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read-active.html">SKIP</a> ([i915#3281]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> ([i915#3281]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@vcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_exec_schedule@pi-common@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296">i915#12296</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12296">i915#12296</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> ([i915#4083]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#4077]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gen3_render_tiledy_blits.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> ([i915#3591]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@i915_pm_rps@reset.html">FAIL</a> ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#4212] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +136 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / [i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / [i915#6095]) +159 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#6095]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616">i915#11616</a> / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_content_protection@legacy@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / [i915#3359]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / [i915#3359]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / [i915#3359]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / [i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> ([i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / [i915#7882])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402">i915#12402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12504">i915#12504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9292])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139">i915#10139</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> ([i915#9688]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#4423] / [i915#9732])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-9/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a> ([i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html">SKIP</a> ([i915#9732]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb5/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-6/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html">FAIL</a> ([i915#5465]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-7/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a> / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-8/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-3/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12564">i915#12564</a> / [i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb2/igt@gem_wait@write-busy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@gem_wait@write-busy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12548">i915#12548</a> / [i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991">i915#10991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-tglu-7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-5/igt@kms_flip@flip-vs-suspend@b-edp1.html">INCOMPLETE</a> ([i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-3/igt@kms_flip@flip-vs-suspend@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-11/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> +2 other tests pass</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@wf_vblank-ts-check.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb7/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12432">i915#12432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105">i915#10105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-2/igt@kms_psr@psr2-sprite-plane-move@edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_vrr@negative-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / [i915#9697])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> ([i915#4423] / [i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> ([i915#4423] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-7/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-10/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#4423] / [i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#3828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([i915#4077] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-17/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-19/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15654/shard-dg1-12/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12064/shard-dg1-18/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#4423] / [i915#9732])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============4071717955818946357==--
