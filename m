Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B75FE77197
	for <igt-dev@archiver.kernel.org>; Sun,  5 Jan 2025 10:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C3810E10D;
	Sun,  5 Jan 2025 10:12:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE010E10D;
 Sun,  5 Jan 2025 10:12:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?1/3=5D_lib/amdgpu=3A_Extract_PCI_device_address_from_file_descrip?=
 =?utf-8?q?tor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 05 Jan 2025 10:12:12 -0000
Message-ID: <173607193239.3712263.4909199349149103026@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250105071551.113830-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250105071551.113830-1-vitaly.prosyak@amd.com>
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

Series: series starting with [1/3] lib/amdgpu: Extract PCI device address from file descriptor
URL   : https://patchwork.freedesktop.org/series/143116/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15903_full -> IGTPW_12388_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12388_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12388_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12388_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-fence.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-dg1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-dg2:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-10/igt@kms_properties@connector-properties-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_properties@connector-properties-legacy.html

  * igt@perf@blocking-parameterized:
    - shard-mtlp:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-mtlp-6/igt@perf@blocking-parameterized.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          [INCOMPLETE][11] ([i915#12353]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-glk8/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][13] ([i915#10131] / [i915#10887]) -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15903_full and IGTPW_12388_full:

### New IGT tests (2) ###

  * igt@gem_render_copy@linear-to-vebox-y-tiled@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@gem_render_copy@yf-tiled-to-vebox-linear@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_12388_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#6230])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@api_intel_bb@crc32.html
    - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#6230])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@api_intel_bb@crc32.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8414]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-3/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8414]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#9323]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          NOTRUN -> [FAIL][27] ([i915#9561]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg1:          [PASS][28] -> [DMESG-WARN][29] ([i915#4423]) +1 other test dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-14/igt@gem_ctx_isolation@preservation-s3.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][37] -> [FAIL][38] ([i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-12/igt@gem_eio@kms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][39] ([i915#8898])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4771])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4036])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          [PASS][45] -> [TIMEOUT][46] ([i915#3778] / [i915#7016])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-11/igt@gem_exec_endless@dispatch.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_endless@dispatch@vecs1:
    - shard-dg2:          [PASS][47] -> [TIMEOUT][48] ([i915#7016])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-11/igt@gem_exec_endless@dispatch@vecs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@gem_exec_endless@dispatch@vecs1.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][53] +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3281]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +17 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4812]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#2190])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk5/igt@gem_lmem_swapping@random-engines.html
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][68] -> [TIMEOUT][69] ([i915#5493]) +1 other test timeout
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#284])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@gem_media_vme.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4083]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@big-bo:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4077]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_mmap_gtt@big-bo.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-1/igt@gem_mmap_gtt@big-bo-tiledy.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4077]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][77] -> [ABORT][78] ([i915#10729]) +1 other test abort
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4083]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4083]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3282]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@gem_pread@exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3282])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-5/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#4270])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [FAIL][86] ([i915#12940])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][88] ([i915#12917] / [i915#12964])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][89] ([i915#12964]) +1 other test timeout
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#4270])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3282])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5190] / [i915#8428]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#8428])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4079])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4079])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4885]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][97] -> [INCOMPLETE][98] ([i915#13306])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-glk3/igt@gem_softpin@noreloc-s3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#3297] / [i915#3323])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3282] / [i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297] / [i915#4880])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3297]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297] / [i915#4958])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3297]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][107] ([i915#13356]) +1 other test incomplete
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk7/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#2527]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#2856]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#2856]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][114] -> [ABORT][115] ([i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#6412])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#7178])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#8399])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#6590]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][121] ([i915#2681]) +1 other test warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][122] ([i915#12797])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#11681] / [i915#6621]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#11681] / [i915#6621])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#11681]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4387])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][127] -> [DMESG-FAIL][128] ([i915#13393]) +1 other test dmesg-fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-mtlp-1/igt@i915_selftest@live@workarounds.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][129] ([i915#9311]) +1 other test dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][130] ([i915#7443])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][131] ([i915#4817])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#8709]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#8709]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#8709]) +11 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-snb:          NOTRUN -> [INCOMPLETE][137] ([i915#13287] / [i915#9878])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb5/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][138] ([i915#13287]) +3 other tests crash
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][139] ([i915#13287])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][140] ([i915#13287])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][141] ([i915#13287]) +3 other tests crash
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#12967] / [i915#6228])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#10333])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#1769] / [i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][145] ([i915#1769])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#5286]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5286]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#5286]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#5286]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3638]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3638]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6187])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#5190]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5190]) +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4538]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +34 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#12313]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#6095]) +204 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][159] +459 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#10307] / [i915#6095]) +171 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6095]) +54 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#12805])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +25 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][164] ([i915#12796]) +1 other test incomplete
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#6095]) +96 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6095]) +19 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#12313])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#12313]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#12313]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3742])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#3742])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7828]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7828]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#7828]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#7828])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7828]) +10 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#7828]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#7116] / [i915#9424]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3299]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3116]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#3116] / [i915#3299])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3299]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][183] ([i915#7173])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9424])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#6944] / [i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-2/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#13049])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#8814])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#3555]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3555]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#13049])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#13049]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#13049])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8814])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-snb:          [PASS][195] -> [SKIP][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-snb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13046] / [i915#5354]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4103] / [i915#4213]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4103]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4103] / [i915#4213]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][201] ([i915#12964]) +5 other tests dmesg-warn
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][202] +18 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][203] ([i915#2346]) +1 other test fail
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#9067])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#4103])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#9833])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9723])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#9723])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9723])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#9833])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8588])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#8588])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3804])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#12402])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#12402])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#12402])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#3840])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#3840])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#3840] / [i915#9053])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#3469])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4854])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#4854])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#2065] / [i915#4854])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#4854])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9337])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#9337])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#658])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#658])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#658])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#4881])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][234] -> [FAIL][235] ([i915#11989]) +5 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#9934]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#3637]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3637]) +8 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3637])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9934]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#9934]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          [PASS][242] -> [FAIL][243] ([i915#11989])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#8381]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][245] -> [FAIL][246] ([i915#11989]) +4 other tests fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-tglu-9/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][247] ([i915#11989] / [i915#12840])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][248] ([i915#11989])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][249] ([i915#11989]) +3 other tests fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672] / [i915#3555])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#2587] / [i915#2672] / [i915#3555])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555] / [i915#5190])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#2587] / [i915#2672]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555] / [i915#8813])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#2672] / [i915#8813])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#2672]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [PASS][264] -> [DMESG-WARN][265] ([i915#12964]) +25 other tests dmesg-warn
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [PASS][266] -> [FAIL][267] ([i915#6880]) +2 other tests fail
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] +38 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#8708]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][270] +51 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#5354]) +32 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#1825]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#9766])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#9766])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#8708]) +26 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3458]) +11 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#8708]) +17 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#3023]) +20 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#3458]) +16 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#1825]) +34 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#12713])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_hdr@static-swap.html

  * igt@kms_histogram@algo-color:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#13389])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_histogram@algo-color.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#12388])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#12388])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#12339])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-5/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#12339])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12394])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#1839]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#6301])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][296] ([i915#10647] / [i915#12169])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][297] ([i915#10647]) +1 other test fail
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#3555]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8806])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#6953] / [i915#9423])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12247]) +5 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#12247]) +9 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#12247] / [i915#6953])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#12247] / [i915#6953])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#12247] / [i915#9423])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12247]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#12247]) +13 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#12247]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#12247] / [i915#6953])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#12247]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#5354])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#9812])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9812]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9685])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#3828])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [FAIL][316] ([i915#12913])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-5/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#5978])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#3361])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#8430])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [PASS][320] -> [SKIP][321] ([i915#12916])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][322] -> [SKIP][323] ([i915#9519])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#9519])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9519]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#9519]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#9519])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#9519]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#6524] / [i915#6805]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#6524])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][333] ([i915#11520]) +10 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#11520]) +8 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#11520]) +9 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][336] ([i915#11520]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#11520]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#12316])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#11520]) +8 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#11520]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +18 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@kms_psr@fbc-pr-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#9688]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-7/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9732]) +18 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-7/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#9732]) +10 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +24 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#1072] / [i915#9732]) +23 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#9685]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#4884])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#5289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#5289])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#5289])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#5289])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#12755])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#12755]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][355] ([i915#13179]) +1 other test abort
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][356] ([i915#13179]) +1 other test abort
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#3555]) +6 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#3555]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][359] ([IGT#160])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][360] ([i915#10959])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#8623])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][362] +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][363] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][364] ([i915#12276]) +3 other tests incomplete
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][365] -> [DMESG-FAIL][366] ([i915#12964]) +2 other tests dmesg-fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][367] ([i915#12964])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#9906])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#11920])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#9906]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#2437]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#2437])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#2437] / [i915#9412])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#2437] / [i915#9412])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#2437] / [i915#9412])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#2437])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][378] ([i915#2437])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#7387])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#2434])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@perf@mi-rpc.html
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#2434])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][382] +383 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb7/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][383] ([i915#13341])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-dg2:          NOTRUN -> [FAIL][384] ([i915#4349]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@perf_pmu@render-node-busy-idle.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#3708] / [i915#4077])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#3708] / [i915#4077])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#3291] / [i915#3708])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#3291] / [i915#3708])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][389] +74 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-4/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#9917])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#9917])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#9917])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][393] ([i915#12910]) +9 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][394] ([i915#12910]) +9 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#4818])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#4818])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][397] ([i915#7297]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-2/igt@gem_ccs@suspend-resume.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][399] ([i915#12392] / [i915#7297]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-2/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-8/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][401] ([i915#13363]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-tglu-4/igt@gem_eio@kms.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][403] ([i915#12714] / [i915#5784]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-13/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][405] ([i915#7975] / [i915#8213]) -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][407] ([i915#7975] / [i915#8213]) -> [PASS][408] +1 other test pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][409] ([i915#5493]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [SKIP][411] -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-dg2-5/igt@gem_lmem_swapping@verify-random.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-dg2-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][413] -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][415] ([i915#12964]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][417] ([i915#13342]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-4/igt@i915_selftest@live.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [DMESG-FAIL][419] ([i915#13338]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [INCOMPLETE][421] ([i915#12761] / [i915#1982]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][423] ([i915#5138]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          [DMESG-WARN][425] ([i915#12917] / [i915#12964]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][427] ([i915#11989]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [DMESG-FAIL][429] ([i915#118] / [i915#1982]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-glk8/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
    - shard-glk:          [FAIL][431] ([i915#11989]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-glk8/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/shard-glk6/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
    - shard-tglu:         [FAIL][433] ([i915#11989]) -> [PASS][434] +4 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15903/shard-tglu-10/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
   [434]: https://intel-gfx-ci.01.org

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12388/index.html
