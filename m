Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DB2E7719A
	for <igt-dev@archiver.kernel.org>; Sat, 11 Jan 2025 14:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339AD10E0D8;
	Sat, 11 Jan 2025 14:05:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C79510E0D8;
 Sat, 11 Jan 2025 14:05:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8032647926256789838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fvm=3A_F?=
 =?utf-8?q?ixed_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 11 Jan 2025 14:05:31 -0000
Message-ID: <173660433136.2415190.7057616344693709226@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109073929.913205-1-pravalika.gurram@intel.com>
In-Reply-To: <20250109073929.913205-1-pravalika.gurram@intel.com>
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

--===============8032647926256789838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fixed documentation
URL   : https://patchwork.freedesktop.org/series/143310/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15927_full -> IGTPW_12414_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12414_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12414_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12414_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-mtlp-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk1/igt@perf_pmu@module-unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@perf_pmu@module-unload.html

  * igt@testdisplay:
    - shard-snb:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb5/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][8] ([i915#12917] / [i915#12964]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  
Known issues
------------

  Here are the changes found in IGTPW_12414_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#6230])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#11078])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#11078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +16 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-idle@vecs0:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8414]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@drm_fdinfo@busy-idle@vecs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8414]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][36] ([i915#12714] / [i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-dg2:          [PASS][37] -> [FAIL][38] ([i915#13364])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg2-4/igt@gem_exec_balancer@full-late-pulse.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4525]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][42] -> [ABORT][43] ([i915#11713])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-8/igt@gem_exec_big@single.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][46] ([i915#6334]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#6344])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#5107])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#5107])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3281]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +10 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4812]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [PASS][60] -> [ABORT][61] ([i915#7975] / [i915#8213]) +1 other test abort
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-2/igt@gem_exec_suspend@basic-s4-devices.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [PASS][62] -> [ABORT][63] ([i915#7975] / [i915#8213]) +1 other test abort
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4860]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4860])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4860])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#2190])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4613] / [i915#7582])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4613] / [i915#7582])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][72] ([i915#5493]) +1 other test timeout
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4613]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#12193])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4613]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4565])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#8289])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#8289])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@gem_mmap_gtt@basic-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4077])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         NOTRUN -> [ABORT][82] ([i915#10729]) +1 other test abort
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4083]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3282]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][87] ([i915#2658]) +1 other test warn
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3282]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][90] ([i915#2658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3282]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12964])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#13398])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#13398])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917] / [i915#12964])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4270]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#8428]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4885])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][103] ([i915#3323])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3297] / [i915#3323])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#3297]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3297] / [i915#4880]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3297] / [i915#4958])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][112] -> [INCOMPLETE][113] ([i915#13356])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@gem_workarounds@suspend-resume.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk8/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#2527]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#2527])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#2856])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#2856]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) -> ([PASS][144], [PASS][145], [DMESG-WARN][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167]) ([i915#118])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk5/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk2/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk5/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk2/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk6/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk6/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk1/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk1/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk8/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk1/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk8/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk8/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk9/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk2/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@i915_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk9/igt@i915_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk6/igt@i915_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk9/igt@i915_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@i915_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk2/igt@i915_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk8/igt@i915_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@i915_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk6/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][168] -> [ABORT][169] ([i915#9820])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][170] -> [ABORT][171] ([i915#12817] / [i915#9820])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][172] ([i915#9820])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7091])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#8399]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#8399])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#6590]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-rkl:          [PASS][177] -> [SKIP][178] ([i915#13328])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][179] ([i915#12797])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#11681] / [i915#6621])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@i915_pm_rps@basic-api.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][181] -> [SKIP][182] ([i915#7984])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-mtlp-5/igt@i915_power@sanity.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#6245])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][184] ([i915#9311]) +1 other test dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb5/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][185] ([i915#4817])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][186] ([i915#12964])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][187] ([i915#4817]) +1 other test incomplete
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#7707])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4212]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-tglu:         [PASS][190] -> [FAIL][191] ([i915#10991] / [i915#13320])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][192] -> [FAIL][193] ([i915#10991])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#8709]) +7 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#8709]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#12967] / [i915#6228])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#9531])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#1769] / [i915#3555])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4538] / [i915#5286]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#5286]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#5286]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#5286]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3638]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3638]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5190])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#6187])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][207] +14 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#4538] / [i915#5190]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#4538]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#6095]) +44 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#12313])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#12313])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#10307] / [i915#10434] / [i915#6095])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#12805])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#6095]) +14 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6095]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#12313])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#6095]) +29 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#10307] / [i915#6095]) +120 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#12313]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#6095]) +91 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#6095]) +135 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#3742])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] +46 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html
    - shard-mtlp:         NOTRUN -> [SKIP][225] +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#11151] / [i915#7828]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#11151] / [i915#7828]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#11151] / [i915#7828]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#11151] / [i915#7828]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#11151] / [i915#7828]) +9 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#11151] / [i915#7828]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][232] -> [SKIP][233] ([i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg2-10/igt@kms_color@deep-color.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#6944] / [i915#9424])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_content_protection@content-type-change.html
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#6944] / [i915#9424])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#3116] / [i915#3299])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3299])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#9424])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_content_protection@lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#9424])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#6944] / [i915#9424])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9424]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][243] ([i915#7173])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#7116] / [i915#9424]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#3555] / [i915#6944] / [i915#9424])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][246] ([i915#12964]) +13 other tests dmesg-warn
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#3555]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#8814])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][249] -> [DMESG-WARN][250] ([i915#12964]) +47 other tests dmesg-warn
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#13049]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#13049]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#13049]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#13049]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#13049])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3555]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#13049]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][258] ([i915#12358] / [i915#7882])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][259] ([i915#12358])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][260] -> [DMESG-WARN][261] ([i915#4423]) +1 other test dmesg-warn
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg1-14/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#9809])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#4103])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#4103] / [i915#4213]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#13046] / [i915#5354]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#4213])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#4103])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9723])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][269] ([i915#12170])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][270] ([i915#11968])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9723])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#8588])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#8588])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#12402])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#3555] / [i915#3840])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#3840])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3840])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#3555] / [i915#3840])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#3555] / [i915#3840]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#3840] / [i915#9053])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3955])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#3469])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#1839])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#9337])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#658])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#3637]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#9934]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9934]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#3637])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#8381])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#9934])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#3637]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][293] -> [FAIL][294] ([i915#11989]) +1 other test fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#8381])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#8381])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555] / [i915#8813])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#2672] / [i915#8813])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#2672]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#2672] / [i915#3555]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#2587] / [i915#2672] / [i915#3555])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#2672] / [i915#3555] / [i915#5190])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#2672])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#2672] / [i915#3555]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#2587] / [i915#2672]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#2587] / [i915#2672]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#2672] / [i915#3555]) +4 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#2672] / [i915#3555]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#2587] / [i915#2672]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][310] +36 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#8708]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][312] ([i915#10056] / [i915#13353])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#8708]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#8708]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#1825]) +38 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9766])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9766])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][318] +68 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#10433] / [i915#3458])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#3458]) +10 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3023]) +18 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#1825]) +7 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#5354]) +15 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3458]) +20 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#3555] / [i915#8228]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#3555] / [i915#8228])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_hdr@static-swap.html
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8228])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#3555] / [i915#8228]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_hdr@static-toggle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#3555] / [i915#8228]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@algo-basic:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#13389])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#13389])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_histogram@algo-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#10656]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#12388])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#12388])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#12394])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#12339])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#12388])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#10656])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#12394])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#12394])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#10656])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#1839]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#6301])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#6301])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][345] +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][346] ([i915#13026]) +1 other test incomplete
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][347] ([i915#12178])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][348] ([i915#7862]) +1 other test fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][349] ([i915#10647] / [i915#12169])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][350] ([i915#10647]) +1 other test fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#3555]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#3555]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#12247]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][354] +382 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#12247]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#12247] / [i915#6953])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#12247]) +9 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#12247]) +7 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#6953])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#12247] / [i915#3555])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#12247] / [i915#6953])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#12247]) +7 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#9812]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#5354]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#5354]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#9812])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#9685])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9685])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#3828])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][370] ([i915#9295])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#3828]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#8430])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#9519])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][374] -> [SKIP][375] ([i915#9519])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#4077]) +3 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#9519])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][378] -> [SKIP][379] ([i915#9519]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#9519])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#6524])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#11520]) +9 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][383] ([i915#11520]) +13 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#11520]) +8 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#9808]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#12316]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#11520]) +7 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][388] ([i915#11520]) +12 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#11520]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#11520]) +6 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#9683])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#9688]) +8 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#1072] / [i915#9732]) +16 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#9732]) +16 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#1072] / [i915#9732]) +10 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#9732]) +13 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#1072] / [i915#9732]) +18 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#9685])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#5289])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#5289]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][401] ([i915#13179]) +1 other test abort
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][402] -> [FAIL][403] ([i915#5465]) +2 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-tglu-6/igt@kms_setmode@basic.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][404] ([IGT#160] / [i915#6493])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#8623])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][406] ([i915#10959])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#8623]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#8623])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][409] -> [FAIL][410] ([i915#9196]) +1 other test fail
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][411] -> [INCOMPLETE][412] ([i915#12276])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][413] ([i915#12276]) +1 other test incomplete
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#9906])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#9906])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#3555] / [i915#8808])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@kms_vrr@flip-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#3555]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#11920])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#11920])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][420] ([i915#3555] / [i915#9906])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#3555] / [i915#9906])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#9906])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@blocking:
    - shard-mtlp:         [PASS][423] -> [FAIL][424] ([i915#10538]) +1 other test fail
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-mtlp-6/igt@perf@blocking.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@perf@blocking.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#2434])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][426] ([i915#2433])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][427] +453 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-snb2/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [PASS][428] -> [FAIL][429] ([i915#4349])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg2-4/igt@perf_pmu@busy-double-start@ccs0.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][430] -> [FAIL][431] ([i915#4349]) +2 other tests fail
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][432] -> [DMESG-FAIL][433] ([i915#12964]) +4 other tests dmesg-fail
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][434] ([i915#8516]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#8516])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#8516])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#8516])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][438] ([i915#3708])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][439] ([i915#3708] / [i915#4077])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][440] ([i915#3708] / [i915#4077])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][441] ([i915#3708])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][442] ([i915#3708])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#3708])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][444] ([i915#9917]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#9917])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][446] ([i915#12910]) +18 other tests fail
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
    - shard-mtlp:         NOTRUN -> [FAIL][447] ([i915#12910]) +9 other tests fail
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-immediate:
    - shard-dg1:          [DMESG-WARN][448] ([i915#4423]) -> [PASS][449] +2 other tests pass
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-dg1-17/igt@gem_eio@in-flight-immediate.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_eio@in-flight-immediate.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [FAIL][450] ([i915#13364]) -> [PASS][451]
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/index.html

--===============8032647926256789838==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fixed documentation</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143310/">https://patchwork.freedesktop.org/series/143310/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12414/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12414/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15927_full -&gt; IGTPW_12414_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12414_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12414_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/index=
.html</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1241=
4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-mtlp-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-=
resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12414/shard-mtlp-4/igt@gem_pxp@verify-pxp-key-change-after-suspe=
nd-resume.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri=
-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-=
1p-offscren-pri-shrfb-draw-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-glk1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/ig=
t@perf_pmu@module-unload.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb5/igt@testdisplay.html">DMESG-WARN</a></=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_pxp@hw-rejects-pxp-buffer:<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</=
a> ([i915#12917] / [i915#12964]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.h=
tml">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12414_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> ([i915#8411])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cac=
he.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@api_intel_bb@crc32.html">SKIP</a>=
 ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@drm_fdinfo@busy-hang@bcs0.html">S=
KIP</a> ([i915#8414]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@drm_fdinfo@busy-idle@vecs0.html"=
>SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@drm_fdinfo@most-busy-idle-check-=
all@bcs0.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_ccs@suspend-resume.html">SKI=
P</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb7/igt@gem_ctx_persistence@legacy-engines=
-mixed-process.html">SKIP</a> ([i915#1099]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@gem_ctx_sseu@engines.html">SKIP</=
a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> ([i915#280])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAI=
L</a> ([i915#12714] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-late-pulse:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg2-4/igt@gem_exec_balancer@full-late-pulse.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/s=
hard-dg2-4/igt@gem_exec_balancer@full-late-pulse.html">FAIL</a> ([i915#1336=
4])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fe=
nce.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-8/igt@gem_exec_big@single.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-6/i=
gt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk9/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_exec_fence@submit3.html">SKIP=
</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel=
-default-uc.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-defa=
ult.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-defau=
lt.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> ([i915#5107])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@gem_exec_reloc@basic-wc-active.ht=
ml">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_exec_reloc@basic-wc-noreloc.h=
tml">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-act=
ive.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_exec_reloc@basic-write-wc-ac=
tive.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-=
contexts.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-2/igt@gem_exec_suspend@basic-s4-devices.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/=
shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#=
7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12414/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT<=
/a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_fence_thrash@bo-copy.html">S=
KIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-=
threaded-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk5/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> ([i915#4613]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.=
html">TIMEOUT</a> ([i915#5493]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk1/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> ([i915#4613]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> ([i915#12193])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_lmem_swapping@verify-random-=
ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_media_fill@media-fill.html">=
SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@gem_media_fill@media-fill.html">S=
KIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@gem_mmap_gtt@basic-copy.html">SKI=
P</a> ([i915#4077]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@gem_mmap_gtt@basic-copy.html">SK=
IP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefa=
ult.html">ABORT</a> ([i915#10729]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_mmap_wc@copy.html">SKIP</a> (=
[i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_mmap_wc@write.html">SKIP</a>=
 ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-un=
flushed.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@gem_partial_pwrite_pread@write.ht=
ml">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a=
> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html"=
>SKIP</a> ([i915#3282]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_pwrite@basic-exhaustion.html=
">SKIP</a> ([i915#3282]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> ([i915#2658])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@gem_pwrite@basic-exhaustion.html=
">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gem_pxp@fail-invalid-protected-co=
ntext.html">TIMEOUT</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@gem_pxp@protected-raw-src-copy-no=
t-readible.html">TIMEOUT</a> ([i915#12917] / [i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_pxp@reject-modify-context-pr=
otection-off-3.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@gem_render_copy@linear-to-vebox-=
y-tiled.html">SKIP</a> ([i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox=
-x-tiled.html">SKIP</a> ([i915#5190] / [i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@gem_set_tiling_vs_blt@untiled-to=
-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> ([i915#3323])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap=
.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-glk7/igt@gem_workarounds@suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard=
-glk8/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#13356]=
)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html"=
>SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html=
">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_15927/shard-glk4/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-=
glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
5927/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_15927/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk5/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_15927/shard-glk2/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard=
-glk6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk6/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
15927/shard-glk1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_15927/shard-glk7/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_15927/shard-glk7/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shar=
d-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_15927/shard-glk1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_15927/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15927/shard-glk9/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_15927/shard-glk3/igt@i915_module_load@load.html">PAS=
S</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_124=
14/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12414/shard-glk7/igt@i915_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12414/shard-glk9/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-=
glk2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_124=
14/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12414/shard-glk5/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk3/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12414/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk5/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_12414/shard-glk4/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/sha=
rd-glk9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12414/shard-glk9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk7/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12414/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12414/shard-glk8/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-glk=
3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/=
shard-glk6/igt@i915_module_load@load.html">PASS</a>) ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_12414/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html=
">ABORT</a> ([i915#9820])</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12414/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.ht=
ml">ABORT</a> ([i915#12817] / [i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@i915_module_load@reload-with-faul=
t-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@i915_pipe_stress@stress-xrgb8888=
-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multi=
ple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shar=
d-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#13328])</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> ([i915#12797])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@i915_pm_rps@basic-api.html">SKIP=
</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-mtlp-5/igt@i915_power@sanity.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-8/igt=
@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@i915_query@hwconfig_table.html">=
SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb5/igt@i915_selftest@mock.html">DMESG-WAR=
N</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@i915_suspend@basic-s3-without-i91=
5.html">INCOMPLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@i915_suspend@fence-restore-untile=
d.html">DMESG-FAIL</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk1/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> ([i915#4817]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due=
-to-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12414/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic.html">FAIL</a> ([i915#10991] / [i915#13320])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-at=
omic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#10991])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8=
709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-r=
c-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@kms_async_flips@invalid-async-fl=
ip.html">SKIP</a> ([i915#12967] / [i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i=
915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-=
90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-off=
set-overflow.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
270.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
90.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-c=
cs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / =
[i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +29 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#60=
95]) +120 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +135 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> +46 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-chan=
ge-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_chamelium_edid@vga-edid-read=
.html">SKIP</a> ([i915#11151] / [i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> ([i915#11151] / [i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> ([i915#11151] / [i915#7828]) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg2-10/igt@kms_color@deep-color.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-dg2-3/i=
gt@kms_color@deep-color.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> ([i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_content_protection@srm@pipe-=
a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_content_protection@type1.htm=
l">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_content_protection@type1.htm=
l">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_cursor_crc@cursor-dpms@pipe-a=
-hdmi-a-1.html">DMESG-WARN</a> ([i915#12964]) +13 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-1=
28x42.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
414/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN=
</a> ([i915#12964]) +47 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> ([i915#12358] / [i915#7882])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12358])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg1-14/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12414/shard-dg1-17/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.=
html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> ([i915#13046] / [i915#5354]) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html=
">FAIL</a> ([i915#12170])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hd=
mi-a-1.html">FAIL</a> ([i915#11968])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_feature_discovery@psr1.html">=
SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_flip@2x-flip-vs-blocking-wf-v=
blank.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> ([i915#9934]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> ([i915#9934])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset.html">SKIP</a> ([i915#3637]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12414/shard-tglu-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.=
html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> ([i915#8381])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_flip@flip-vs-fences.html">SKI=
P</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
([i915#2672] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915=
#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555=
]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] =
/ [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]=
 / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2=
672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i9=
15#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#258=
7] / [i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-rgb=
101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> ([i915#10056] / [i915#13353])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#1825]) +38 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> ([i915#9766])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> +68 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458])=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#3023]) +18 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#1825]) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#5354]) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-pwrite.html">SKIP</a> ([i915#3458]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_hdr@static-swap.html">SKIP</a=
> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_hdr@static-toggle.html">SKIP<=
/a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP=
</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_histogram@algo-basic.html">S=
KIP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_histogram@algo-color.html">SK=
IP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> ([i915#12388])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> ([i915#1839]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_panel_fitting@legacy.html">S=
KIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b=
-with-3-lanes.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk6/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> ([i915#13026]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> ([i915#12178])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-c-hdmi-a-1.html">FAIL</a> ([i915#7862]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#10647]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk7/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation.html">SKIP</a> +382 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-=
20x20-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953=
])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> ([i915#12247]) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> ([i915#5354]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> ([i915#5354]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> ([i915#3828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-rkl-=
4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_pm_rpm@fences.html">SKIP</a>=
 ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-d=
g2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_prime@d3hot.html">SKIP</a> (=
[i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> ([i915#11520]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area-big-fb.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-4/igt@kms_psr2_sf@psr2-cursor-plane-mov=
e-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html">SKIP</a> ([i915#11520]) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-2/igt@kms_psr@fbc-psr-primary-page-fli=
p@edp-1.html">SKIP</a> ([i915#9688]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt=
.html">SKIP</a> ([i915#1072] / [i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-9/igt@kms_psr@psr-primary-render.html"=
>SKIP</a> ([i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html">SKI=
P</a> ([i915#1072] / [i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html">SK=
IP</a> ([i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@kms_psr@psr2-suspend.html">SKIP</=
a> ([i915#1072] / [i915#9732]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-tglu-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-tglu-2/igt=
@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_sysfs_edid_timing.html">FAIL=
</a> ([IGT#160] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> ([i915#8623])</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> ([i915#10959])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-6/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-8/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-ed=
p-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12414/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-ed=
p-1.html">FAIL</a> ([i915#9196]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a=
-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12414/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@=
pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12276])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-glk4/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> ([i915#12276]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> ([i915#9906])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-7/igt@kms_vrr@flip-dpms.html">SKIP</a>=
 ([i915#3555] / [i915#8808])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-10/igt@kms_vrr@flip-dpms.html">SKIP</a>=
 ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-4/igt@kms_vrr@lobf.html">SKIP</a> ([i91=
5#11920])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-3/igt@kms_vrr@lobf.html">SKIP</a> ([i9=
15#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> ([i915#3555] / [i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@kms_vrr@negative-basic.html">SKI=
P</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-mtlp-6/igt@perf@blocking.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-mtlp-4/igt@p=
erf@blocking.html">FAIL</a> ([i915#10538]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-11/igt@perf@mi-rpc.html">SKIP</a> ([i91=
5#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-1/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-snb2/igt@perf_pmu@busy-accuracy-98.html">SK=
IP</a> +453 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg2-4/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/sha=
rd-dg2-8/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349])</=
li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/s=
hard-mtlp-2/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> ([i915#4349=
]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12414/shard-=
rkl-4/igt@perf_pmu@most-busy-check-all.html">DMESG-FAIL</a> ([i915#12964]) =
+4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> ([i915#8516]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> ([i915#8516])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> ([i915#8516])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-3/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-17/igt@prime_vgem@basic-fence-read.html=
">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-18/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-1/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> ([i915#3708])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg2-3/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-dg1-12/igt@sriov_basic@bind-unbind-vf.html"=
>SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-=
on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe=
-on@numvfs-1.html">FAIL</a> ([i915#12910]) +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12414/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe=
-on@numvfs-2.html">FAIL</a> ([i915#12910]) +9 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15927/shard-dg1-17/igt@gem_eio@in-flight-immediate.html">DMESG-WARN=
</a> ([i915#4423]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12414/shard-dg1-12/igt@gem_eio@in-flight-immediate.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_1">FAIL</a> ([i915#13364]) -&gt; [PASS][451]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8032647926256789838==--
