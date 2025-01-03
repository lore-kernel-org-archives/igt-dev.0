Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03239E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 16:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7FA10E158;
	Fri,  3 Jan 2025 16:17:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ECB10E085;
 Fri,  3 Jan 2025 16:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Fplane=5Fscal?=
 =?utf-8?q?ing=3A_Add_logs_to_skips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 16:17:00 -0000
Message-ID: <173592102018.2705020.15008137703335038509@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103103414.10731-1-pranay.samala@intel.com>
In-Reply-To: <20250103103414.10731-1-pranay.samala@intel.com>
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

Series: tests/kms_plane_scaling: Add logs to skips
URL   : https://patchwork.freedesktop.org/series/143093/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15898_full -> IGTPW_12380_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12380_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12380_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12380_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@execbuf:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-5/igt@gem_eio@execbuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-4/igt@gem_eio@execbuf.html

  * igt@gem_linear_blits@normal:
    - shard-dg1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-13/igt@gem_linear_blits@normal.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_linear_blits@normal.html

  * igt@kms_flip@blocking-wf_vblank@b-vga1:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-snb2/igt@kms_flip@blocking-wf_vblank@b-vga1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb5/igt@kms_flip@blocking-wf_vblank@b-vga1.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][7] ([i915#9820]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15898_full and IGTPW_12380_full:

### New IGT tests (2) ###

  * igt@gem_render_copy@linear-to-vebox-y-tiled@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@gem_render_copy@yf-tiled-to-vebox-linear@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_12380_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][11] ([i915#9318])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +25 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9323]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][22] -> [INCOMPLETE][23] ([i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#6335]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][28] -> [FAIL][29] ([i915#9561]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-1/igt@gem_ctx_freq@sysfs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][37] -> [FAIL][38] ([i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-18/igt@gem_eio@kms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][39] ([i915#8898])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4525])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +15 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][55] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4860])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#4613]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk2/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][62] -> [TIMEOUT][63] ([i915#5493]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-8/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4077]) +10 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4077]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-1/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3282]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][77] ([i915#12964])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#4270])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#13398])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][82] +370 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#8411])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4079]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297] / [i915#3323])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3281] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][96] +367 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb4/igt@gem_vm_create@invalid-create.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][97] ([i915#13356])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@gem_workarounds@suspend-resume-context.html
    - shard-rkl:          [PASS][98] -> [DMESG-FAIL][99] ([i915#12964])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][100] -> [INCOMPLETE][101] ([i915#13356])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#2527] / [i915#2856])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [ABORT][108] ([i915#13010]) +1 other test abort
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][109] ([i915#9820])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][110] -> [ABORT][111] ([i915#10887] / [i915#12817] / [i915#9820])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#7178])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#7091])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#8399])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#6590]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          NOTRUN -> [FAIL][116] ([i915#12942]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][117] -> [FAIL][118] ([i915#12739] / [i915#3591])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-3/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#11681])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][123] ([i915#9311]) +1 other test dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@i915_selftest@mock@memory_region.html
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][124] ([i915#9311]) +1 other test dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][125] ([i915#4817]) +1 other test incomplete
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#7707])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4212]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#12454] / [i915#12712])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#8709]) +11 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#8709]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg1:          NOTRUN -> [WARN][131] ([i915#13287])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][132] ([i915#13287]) +7 other tests crash
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][133] ([i915#13287])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][134] ([i915#13287]) +7 other tests crash
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#10333]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-mtlp:         [PASS][137] -> [FAIL][138] ([i915#11808] / [i915#5956]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#1769] / [i915#3555])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#5286]) +11 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#5286]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5286]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#5286]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][145] -> [FAIL][146] ([i915#5138])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3638]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3638]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6187])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#5190]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4538] / [i915#5190]) +10 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6095]) +14 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12313])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +34 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6095]) +69 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6095]) +104 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6095]) +128 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#6095]) +20 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#10307] / [i915#6095]) +163 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#12313]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#12313]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#12313])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#3742])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#3742])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4087]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#7828]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#7828]) +9 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#7828]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7828]) +11 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#7828])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7828]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][175] -> [SKIP][176] ([i915#3555])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-10/igt@kms_color@deep-color.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [TIMEOUT][177] ([i915#7173]) +1 other test timeout
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#6944] / [i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3116] / [i915#3299]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3299])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3299])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#7118] / [i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9424]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#6944] / [i915#7116] / [i915#7118])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#13049]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555]) +8 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3555]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#13049]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#13049]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8814]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][193] ([i915#4423])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][194] -> [DMESG-WARN][195] ([i915#12964]) +36 other tests dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#13049])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#13049])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8814])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13046] / [i915#5354]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#4103])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-dg1:          [PASS][201] -> [DMESG-WARN][202] ([i915#4423])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-17/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#9809])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][204] ([i915#2346])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#9067])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#9067])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#9067])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#4103] / [i915#4213])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#9833])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#9723])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#9723])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#9833])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#8588])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8588])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#8588])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3804])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3804])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#12402])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#12402])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#8812]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#3840])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3555] / [i915#3840])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#4854])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-8/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#4854])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#4854])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#1839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#1839])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#9337])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#9337])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#658])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#658]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#658])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#658])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#4881])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#4881])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#8381])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#3637]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#3637])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][241] -> [FAIL][242] ([i915#11989]) +3 other tests fail
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#9934]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#9934]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9934]) +11 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#3637]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][247] -> [DMESG-WARN][248] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#8381])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][250] ([i915#11989]) +7 other tests fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-7/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#2672]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#2672]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672] / [i915#3555])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#2587] / [i915#2672]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#5354]) +27 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][262] -> [SKIP][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] +39 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#8708]) +17 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][266] -> [FAIL][267] ([i915#6880])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#5439]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][269] +30 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#1825]) +58 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8708]) +20 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][272] +38 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][273] +93 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#9766])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9766])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3458]) +15 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#3458]) +17 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#3023]) +36 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#1825]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#8708]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][281] -> [SKIP][282] ([i915#3555] / [i915#8228])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12713])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12713])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#3555] / [i915#8228]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-8/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@algo-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#13389])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#13388]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#13388]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_histogram@global-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#10656])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#10656])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#12388])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#12394])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#12339])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#4816])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#1839])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#6301])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#6301])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][302] ([i915#13026]) +1 other test incomplete
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][303] ([i915#10647] / [i915#12177])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][304] ([i915#10647]) +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8821])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8806])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#13046] / [i915#5354] / [i915#9423])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#12247]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#12247]) +12 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#12247] / [i915#9423])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#12247]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12247] / [i915#6953]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#12247] / [i915#6953])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#12247]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#12247] / [i915#6953] / [i915#9423])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12247]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#5354])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9812])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#12343])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9685])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#9685])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#3828])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#3828])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3361])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-14/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#3361]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9340])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#9519]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [FAIL][329] ([i915#8717])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9519])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#9519])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#6524] / [i915#6805])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#6524])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#6524])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][335] ([i915#11520]) +10 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#11520]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#12316]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#11520]) +12 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][339] ([i915#11520]) +7 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#11520]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#11520]) +5 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#11520]) +6 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#9683])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#9683]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#9683])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#1072] / [i915#9732]) +27 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9732]) +8 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +21 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#9688]) +6 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#1072] / [i915#9732]) +24 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#4077] / [i915#9688]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-1/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +15 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#9685])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][354] ([i915#12964]) +31 other tests dmesg-warn
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#5289]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#5289])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#12755] / [i915#5190])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#5289]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#12755]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#3555]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][361] ([i915#13179]) +1 other test abort
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-snb7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#3555] / [i915#8809])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#3555]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][364] ([IGT#160])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][365] ([i915#10959])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#8623])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#8623])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][368] +3 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#8808] / [i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-8/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][372] -> [FAIL][373] ([i915#10393]) +1 other test fail
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-3/igt@kms_vrr@negative-basic.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#3555] / [i915#9906])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555] / [i915#9906])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#9906])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#2437]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-10/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#2437])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#2437])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#2435])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#8850])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][382] +13 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][383] ([i915#13341])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#3291] / [i915#3708]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#3291] / [i915#3708])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#3708])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#3708])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-7/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#9917]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#9917]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-mtlp:         NOTRUN -> [FAIL][390] ([i915#12910]) +9 other tests fail
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-mtlp-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][391] ([i915#12910]) +9 other tests fail
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#4818])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline@vcs0:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12964]) -> [PASS][394] +31 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-7/igt@gem_ctx_shared@exec-single-timeline@vcs0.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-7/igt@gem_ctx_shared@exec-single-timeline@vcs0.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][395] ([i915#13363]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-8/igt@gem_eio@kms.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-6/igt@gem_eio@kms.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][397] ([i915#11713]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-4/igt@gem_exec_big@single.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-dg2:          [INCOMPLETE][399] -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-3/igt@gem_exec_endless@dispatch@ccs0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][401] ([i915#11441] / [i915#13304]) -> [PASS][402] +1 other test pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [SKIP][403] -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-dg2-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][405] ([i915#13356]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-5/igt@gem_workarounds@suspend-resume.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-4/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][407] ([i915#12964]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [DMESG-WARN][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432]) ([i915#118]) -> ([PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk6/igt@i915_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@i915_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk2/igt@i915_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk6/igt@i915_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@i915_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk8/igt@i915_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk8/igt@i915_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk2/igt@i915_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@i915_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@i915_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk1/igt@i915_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk2/igt@i915_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk9/igt@i915_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk2/igt@i915_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk9/igt@i915_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk3/igt@i915_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk8/igt@i915_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk3/igt@i915_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk8/igt@i915_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk4/igt@i915_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk4/igt@i915_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/shard-glk5/igt@i915_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12380/index.html
