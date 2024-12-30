Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD71CE77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 21:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8236110E58B;
	Mon, 30 Dec 2024 21:03:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E53510E388;
 Mon, 30 Dec 2024 21:03:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Ffault?=
 =?utf-8?q?=5Finjection=3A_Inject_errors_during_xe=5Fguc=5Fct=5Fsend=5Frecv_?=
 =?utf-8?q?=26_xe=5Fguc=5Fmmio=5Fsend=5Frecv?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Dec 2024 21:03:49 -0000
Message-ID: <173559262924.1068019.7837554142044966535@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
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

Series: tests/intel/xe_fault_injection: Inject errors during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
URL   : https://patchwork.freedesktop.org/series/142999/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15892_full -> IGTPW_12365_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12365_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12365_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12365_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:
    - shard-tglu:         [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4:
    - shard-dg1:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a4.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-mtlp:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-2/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          [INCOMPLETE][12] ([i915#13287]) -> [INCOMPLETE][13] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk2/igt@kms_async_flips@crc-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk7/igt@kms_async_flips@crc-atomic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@reload-with-fault-injection:
    - {shard-dg2-9}:      NOTRUN -> [DMESG-WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-9/igt@i915_module_load@reload-with-fault-injection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15892_full and IGTPW_12365_full:

### New IGT tests (2) ###

  * igt@kms_flip@blocking-wf_vblank@a-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [8.13] s

  * igt@kms_flip@blocking-wf_vblank@b-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [8.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_12365_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#8411]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#11078])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +9 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@drm_fdinfo@busy@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8414]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-3/igt@drm_fdinfo@busy@bcs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@drm_fdinfo@isolation@vecs0.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#3281]) +14 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#6335])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb7/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][35] ([i915#8898]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb2/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          [PASS][36] -> [FAIL][37] ([i915#12714] / [i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4036])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4036])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       [PASS][45] -> [ABORT][46] ([i915#11713])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-1/igt@gem_exec_big@single.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#6334]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          [PASS][48] -> [TIMEOUT][49] ([i915#3778] / [i915#7016])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_exec_endless@dispatch.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-6/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_endless@dispatch@vecs1:
    - shard-dg2:          [PASS][50] -> [TIMEOUT][51] ([i915#7016])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_exec_endless@dispatch@vecs1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-6/igt@gem_exec_endless@dispatch@vecs1.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-rkl:          [PASS][54] -> [DMESG-WARN][55] ([i915#12964]) +24 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-7/igt@gem_exec_nop@basic-sequential.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#5107])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-1/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3281]) +17 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4812]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][61] +467 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb2/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][62] ([i915#12964]) +1 other test dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4860]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4860]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4860]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#2190])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4613]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#12193])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4565])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk8/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#284])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-4/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-5/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4083]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3282]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3282]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@gem_pread@self.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][81] ([i915#2658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][82] ([i915#2658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#13398])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][85] ([i915#12964])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][87] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4270])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8428]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#5190] / [i915#8428]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4079])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3282]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4885])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][94] ([i915#13306])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4077]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4879])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3297] / [i915#4880])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3281] / [i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][102] -> [INCOMPLETE][103] ([i915#13356])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#2856])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#2527]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#2527]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][110] -> [ABORT][111] ([i915#9820])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#6412])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#6590]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][114] ([i915#2681]) +1 other test warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#4387])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#7984])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#6245])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][118] -> [DMESG-FAIL][119] ([i915#13393]) +1 other test dmesg-fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-4/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][120] ([i915#9311]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [PASS][121] -> [ABORT][122] ([i915#13010]) +4 other tests abort
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][123] ([i915#4817])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk5/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#7707])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4215])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4212]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][128] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#8709]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][130] ([i915#13287] / [i915#9878])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_async_flips@crc.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][131] ([i915#13287] / [i915#9878])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][132] ([i915#13287]) +1 other test incomplete
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][133] ([i915#13287]) +1 other test incomplete
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][134] ([i915#13287])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][135] ([i915#13287])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][136] ([i915#13287]) +3 other tests crash
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#12967])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#9531])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][139] ([i915#1769]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#1769] / [i915#3555])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#5286])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#5286]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5286]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5286]) +8 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3638]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3638]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +13 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +34 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#12313]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +138 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#12313]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#6095]) +29 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#12805])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6095]) +82 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#6095]) +19 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#12805])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][161] ([i915#12796]) +2 other tests incomplete
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][162] ([i915#12796])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +18 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#6095]) +196 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#11616] / [i915#7213]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7828]) +12 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][168] +6 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#7828]) +12 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#7828]) +10 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4423] / [i915#7828])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#7828]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#7828]) +6 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7828]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3116])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3299]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3299])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#7118] / [i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#9424]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#7116] / [i915#9424]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][184] ([i915#1339] / [i915#7173]) +1 other test fail
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][185] ([i915#12964]) +26 other tests dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#3555]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#13049]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#13049])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#13049]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#13049]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3555]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-tglu:         [PASS][193] -> [ABORT][194] ([i915#10159])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@kms_cursor_crc@cursor-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#13046] / [i915#5354]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-snb:          [PASS][196] -> [SKIP][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#4213])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4103] / [i915#4213]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#4103])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#4103])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#9809]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][203] +26 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          NOTRUN -> [FAIL][204] ([i915#2346])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#9723])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#9833])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8588])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#12402])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#8812])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3840])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#3840])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#3840])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3840] / [i915#9053])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#3469])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4854])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#1839])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#3637]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3637]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9934]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3637]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#4839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9934]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9934]) +6 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-snb:          NOTRUN -> [FAIL][231] ([i915#11989]) +3 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][232] -> [FAIL][233] ([i915#11989])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
    - shard-tglu:         [PASS][234] -> [FAIL][235] ([i915#11989]) +2 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][236] ([i915#11989])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#8381])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][238] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][239] ([i915#12745])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-tglu:         [PASS][240] -> [FAIL][241] ([i915#10826])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-snb:          [PASS][242] -> [FAIL][243] ([i915#11989]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb5/igt@kms_flip@wf_vblank-ts-check.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [PASS][244] -> [FAIL][245] ([i915#11989]) +2 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4:
    - shard-dg1:          [PASS][246] -> [FAIL][247] ([i915#11989]) +1 other test fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#2672]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8810] / [i915#8813])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8810])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#2672]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#2587] / [i915#2672]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#8708]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [PASS][263] -> [FAIL][264] ([i915#6880]) +2 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] +38 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5354]) +24 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#1825]) +9 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#5439])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3458]) +11 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#8708]) +22 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][271] +54 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#5439])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9766])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9766])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#9766])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#9766])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#10433] / [i915#3458])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#3023]) +28 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#8708]) +17 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#1825]) +44 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#3458]) +32 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#12713])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#12713])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#12713])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_histogram@algo-color:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#13389]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_histogram@algo-color.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#12388])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#12394])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12339])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12388])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#12339])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-invalid-plane:
    - shard-dg1:          [PASS][296] -> [DMESG-WARN][297] ([i915#4423]) +2 other tests dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-12/igt@kms_lease@lease-invalid-plane.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_lease@lease-invalid-plane.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#6301])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][299] +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][300] ([i915#13026]) +1 other test incomplete
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][301] ([i915#10647] / [i915#12169])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][302] ([i915#10647]) +1 other test fail
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][303] ([i915#12917] / [i915#12964])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8821])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3555]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-glk:          [PASS][306] -> [SKIP][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk4/igt@kms_plane_scaling@intel-max-src-size.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk2/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#6953])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#6953])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#12247]) +10 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#12247]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][312] +377 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#12247] / [i915#6953])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#12247] / [i915#6953]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#12247]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#12247] / [i915#3555])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#12247] / [i915#3555] / [i915#9423])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#12247] / [i915#3555])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#12247]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#12247]) +31 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#5354])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#9812])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12343])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#5354]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#3828])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3361])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#9685]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#9685])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#8430])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#4077]) +17 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#9519]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#9519]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][333] -> [SKIP][334] ([i915#9519]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#6524])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#6524] / [i915#6805])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#6524])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#11520]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#11520]) +10 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][340] ([i915#11520]) +10 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][341] ([i915#11520]) +8 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#11520]) +12 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#11520]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#11520]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#9683])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#9683])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9688]) +5 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +13 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-9/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#1072] / [i915#9732]) +18 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][350] ([i915#9732]) +7 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#1072] / [i915#9732]) +25 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-cpu@edp-1:
    - shard-mtlp:         [PASS][352] -> [FAIL][353] ([i915#10105])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-2/igt@kms_psr@psr2-sprite-mmap-cpu@edp-1.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-cpu@edp-1.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#1072] / [i915#9732]) +21 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#9685]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#4235])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#5289])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#5289])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#5289])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#3555]) +14 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][361] ([i915#13179]) +1 other test abort
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-snb:          NOTRUN -> [FAIL][362] ([IGT#160] / [i915#6493])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#8623])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#8623])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [PASS][365] -> [DMESG-WARN][366] ([i915#12917] / [i915#12964])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][367] -> [INCOMPLETE][368] ([i915#12276])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#2437]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][373] ([i915#2437])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#2437])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#2437]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#2437])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#2437] / [i915#9412])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#2434])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#2433])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][380] ([i915#12549] / [i915#6806]) +1 other test fail
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#8516]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [PASS][382] -> [FAIL][383] ([i915#4349]) +2 other tests fail
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-5/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@vcs1.html
    - shard-dg1:          NOTRUN -> [FAIL][384] ([i915#4349]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#3708] / [i915#4077])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#3291] / [i915#3708])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#3708] / [i915#4077]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-5/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#3708]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#3708])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#3708]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][391] +63 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-3/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][392] ([i915#12910]) +18 other tests fail
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-7/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#9917]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#9917])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#9917])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-tglu-1:       NOTRUN -> [FAIL][396] ([i915#12910])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][397] ([i915#12910]) +8 other tests fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@syncobj_timeline@single-wait-available-signaled:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][398] ([i915#4423]) +1 other test dmesg-warn
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-14/igt@syncobj_timeline@single-wait-available-signaled.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][399] ([i915#4818])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_freq@sysfs:
    - {shard-dg2-9}:      [FAIL][400] ([i915#9561]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-9/igt@gem_ctx_freq@sysfs.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-9/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][402] ([i915#13363]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@gem_eio@kms.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][404] ([i915#7975] / [i915#8213]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-17/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_spin_batch@legacy@render:
    - shard-rkl:          [DMESG-WARN][406] ([i915#12964]) -> [PASS][407] +21 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-2/igt@gem_spin_batch@legacy@render.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@gem_spin_batch@legacy@render.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [DMESG-WARN][408] -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][410] ([i915#3591]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][412] ([i915#12761]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-mtlp:         [FAIL][414] ([i915#5138]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-mtlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][416] ([i915#12796]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-snb:          [SKIP][418] -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][420] ([i915#11989]) -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-rkl:          [FAIL][422] ([i915#11989]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][424] ([i915#9519]) -> [PASS][425] +3 other tests pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [INCOMPLETE][426] ([i915#10553]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk3/igt@kms_pm_rpm@system-suspend-modeset.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/shard-glk7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@busy-idle-check

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12365/index.html
