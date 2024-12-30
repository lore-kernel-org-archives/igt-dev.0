Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DCCE77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 22:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2610E4DA;
	Mon, 30 Dec 2024 22:27:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157E10E599;
 Mon, 30 Dec 2024 22:27:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/amdgpu=3A_enhance_re?=
 =?utf-8?q?adability_of_packet_creation_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Dec 2024 22:27:09 -0000
Message-ID: <173559762996.1092470.1194896170487316493@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230200115.93749-1-vitaly.prosyak@amd.com>
In-Reply-To: <20241230200115.93749-1-vitaly.prosyak@amd.com>
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

Series: lib/amdgpu: enhance readability of packet creation logic
URL   : https://patchwork.freedesktop.org/series/143020/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15892_full -> IGTPW_12368_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12368_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12368_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12368_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [PASS][4] -> [FAIL][5] +4 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-2.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk2/igt@perf_pmu@rc6-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15892_full and IGTPW_12368_full:

### New IGT tests (2) ###

  * igt@kms_flip@nonexisting-fb@a-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_flip@nonexisting-fb@b-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  

Known issues
------------

  Here are the changes found in IGTPW_12368_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#8411]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#9318])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414]) +14 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][17] -> [INCOMPLETE][18] ([i915#12392])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#6335])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#12353])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-4/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][32] ([i915#7975] / [i915#8213])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][33] ([i915#4391] / [i915#4423])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][34] ([i915#13390])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][35] ([i915#8898])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4771]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4812]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#6334]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#6344])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#5107])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +19 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4812]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][52] -> [INCOMPLETE][53] ([i915#11441] / [i915#13304])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][54] -> [INCOMPLETE][55] ([i915#11441])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4860]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#2190])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#4613]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4613]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#12193])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4565])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4083]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-5/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@gem_pread@self.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][72] ([i915#12964]) +1 other test timeout
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4270]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [PASS][75] -> [SKIP][76] ([i915#4270]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-2/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][77] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4270]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#5190] / [i915#8428]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4079])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3282]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4885])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][86] ([i915#13263])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb5/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [ABORT][87] ([i915#13263])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk4/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4879])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#3323])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3281] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][95] +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#6412])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8399])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#6590]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][105] ([i915#2681]) +1 other test warn
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-rkl:          [PASS][106] -> [SKIP][107] ([i915#13328])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#11681]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#6188])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live:
    - shard-tglu:         [PASS][110] -> [ABORT][111] ([i915#12061] / [i915#13010])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-3/igt@i915_selftest@live.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [PASS][112] -> [ABORT][113] ([i915#13010])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-3/igt@i915_selftest@live@sanitycheck.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][114] ([i915#9311]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][115] ([i915#4817]) +1 other test incomplete
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#7707])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4212]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#12761]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#8709]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#8709]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#8709]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][124] ([i915#13287] / [i915#9878])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-6/igt@kms_async_flips@crc.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][125] ([i915#13287] / [i915#9878])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-10/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][126] ([i915#13287]) +1 other test incomplete
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][127] ([i915#13287])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-10/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
    - shard-glk:          [PASS][128] -> [INCOMPLETE][129] ([i915#13287])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][130] ([i915#13287])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][131] ([i915#13287]) +3 other tests crash
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#12967])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#9531])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][134] ([i915#1769]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#5286]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5286]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#5286])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#5286]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5286]) +7 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3638]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5190]) +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#6095]) +186 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +54 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#12313]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#6095]) +146 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#12313]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12313]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#12805])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#6095]) +72 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#6095]) +14 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#12805])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#12805])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][156] ([i915#12796])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +21 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#6095]) +39 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#3742])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#7828]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +13 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828]) +12 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#7828]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +13 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#7828]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3299])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3116])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118] / [i915#9424]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9424]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#7116] / [i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3555]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#13049]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#13049])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][178] ([i915#12917] / [i915#12964])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#8814])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#13049]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#13049]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3555]) +7 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-glk:          [PASS][183] -> [DMESG-FAIL][184] ([i915#118] / [i915#1982]) +1 other test dmesg-fail
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk6/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#13046] / [i915#5354]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-snb:          [PASS][186] -> [SKIP][187] +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#4213])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#4103])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4103] / [i915#4213])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#9809]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][193] +30 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][194] -> [FAIL][195] ([i915#2346])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9067])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#4103])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#4103])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-glk:          NOTRUN -> [FAIL][199] ([i915#2346])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#9723])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][201] ([i915#12170])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][202] ([i915#11968])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#9723])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#9833])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#8588])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3555]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#12402])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][208] ([i915#12964]) +30 other tests dmesg-warn
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-6/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8812])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#3840] / [i915#9053])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3469])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3469])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#4854])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-2/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4854])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#4854])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#1839])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#1839]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#9337])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#658]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#658])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#658])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3637]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][228] -> [FAIL][229] ([i915#11989]) +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9934]) +11 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#9934]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3637]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][233] ([i915#4839])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#3637]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#9934]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [FAIL][236] ([i915#11989]) +1 other test fail
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#8381])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#8381]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][239] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][240] ([i915#12745])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8810] / [i915#8813])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8810])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#2672]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2672]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2587] / [i915#2672]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#8708]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [PASS][256] -> [FAIL][257] ([i915#6880])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5354]) +24 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#1825]) +8 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#5439])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#5439])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#3458]) +14 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][263] +62 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#8708]) +18 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#5439])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9766])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#9766])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#9766])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9766])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#10433] / [i915#3458]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3023]) +30 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#8708]) +17 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#1825]) +45 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] +52 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#3458]) +29 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8228]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8228])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#3555] / [i915#8228])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#12713])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#12713])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-11/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [PASS][282] -> [SKIP][283] ([i915#3555] / [i915#8228])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_histogram@algo-color:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#13389]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#13388])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_histogram@global-basic.html
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#13388])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_histogram@global-basic.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#10656]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#12388])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#12394])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#12339])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#10656])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12388])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#12339])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#6301])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][296] +6 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][297] ([i915#13026]) +1 other test incomplete
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8821])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#6953])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#6953])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12247]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#9423])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12247]) +7 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12247]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#12247]) +9 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#12247] / [i915#6953]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12247] / [i915#6953] / [i915#9423])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#12247] / [i915#3555])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#12247] / [i915#3555])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12247]) +31 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#5354])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#5354]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#3828])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#3828])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][315] -> [FAIL][316] ([i915#9295])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#9685])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#9685])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#3828])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9519])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#4077]) +15 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][322] -> [FAIL][323] ([i915#8717])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-4/igt@kms_pm_rpm@i2c.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][324] -> [SKIP][325] ([i915#12916])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9519]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#9519]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][329] -> [SKIP][330] ([i915#9519])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#4077])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#6524] / [i915#6805])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#6524])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][334] ([i915#11520]) +11 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#12316])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#11520]) +10 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#11520]) +13 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#11520]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][339] ([i915#11520]) +12 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#11520]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#11520]) +3 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9683])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#9683])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#9683])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +24 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][346] +434 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9688]) +6 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +9 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#1072] / [i915#9732]) +17 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][350] ([i915#9732]) +14 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#1072] / [i915#9732]) +24 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#9685]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#9685])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#4235])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#12755]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#5190])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#5289]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#5289]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#5289])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#3555]) +11 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][361] ([i915#13179]) +1 other test abort
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk3/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][362] -> [FAIL][363] ([i915#5465]) +2 other tests fail
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-2/igt@kms_setmode@basic.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-9/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#3555])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#8623])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#8623])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [PASS][367] -> [DMESG-WARN][368] ([i915#12917] / [i915#12964])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vrr@max-min:
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#2437]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#2437] / [i915#9412])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#2437] / [i915#9412])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#2437]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#2437])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][377] ([i915#2437]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk9/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#2437] / [i915#9412])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-11/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#2434])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@perf@mi-rpc.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][380] -> [DMESG-WARN][381] ([i915#12964]) +30 other tests dmesg-warn
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-1/igt@perf@polling@0-rcs0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-3/igt@perf@polling@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#2433])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][383] +421 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb7/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-hang@vcs1:
    - shard-mtlp:         [PASS][384] -> [FAIL][385] ([i915#4349]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-4/igt@perf_pmu@busy-hang@vcs1.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-6/igt@perf_pmu@busy-hang@vcs1.html

  * igt@perf_pmu@busy-idle-check-all@vecs1:
    - shard-dg2:          [PASS][386] -> [FAIL][387] ([i915#4349])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vecs1.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#8516]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#3708] / [i915#4077])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#3708] / [i915#4077])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-1/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#3291] / [i915#3708])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#3291] / [i915#3708])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#3708])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#3708])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-11/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][395] +69 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-6/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#3708]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-17/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][397] ([i915#12910]) +18 other tests fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-5/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#9917])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#9917])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#9917])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][401] ([i915#12910]) +8 other tests fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#4818])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][403] ([i915#13363]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@gem_eio@kms.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][405] ([i915#12543] / [i915#5784]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-13/igt@gem_eio@reset-stress.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-rkl:          [DMESG-WARN][407] ([i915#12964]) -> [PASS][408] +22 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@gem_exec_flush@basic-uc-prw-default.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-7/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][409] ([i915#7975] / [i915#8213]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         [SKIP][411] ([i915#4270]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-tglu-8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][413] ([i915#13356]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][415] ([i915#4817]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk1/igt@i915_suspend@debugfs-reader.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-glk6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][417] ([i915#12761]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-mtlp:         [FAIL][419] ([i915#5138]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-mtlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [DMESG-FAIL][421] ([i915#12964]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-snb:          [SKIP][423] -> [PASS][424] +3 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/shard-snb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][425] ([i915#2346]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [426]: https://intel-g

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12368/index.html
