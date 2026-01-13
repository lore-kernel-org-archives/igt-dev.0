Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D9DD2D0E4
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1510E334;
	Tue, 13 Jan 2026 12:14:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662110E334;
 Tue, 13 Jan 2026 12:14:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7908725471737361399=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fevict?=
 =?utf-8?q?=3A_overcommit_tests_for_fault-mode_and_non-fault-mode_VMs_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jan 2026 12:14:48 -0000
Message-ID: <176830648866.149757.12246567094297758048@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113070806.189718-1-sobin.thomas@intel.com>
In-Reply-To: <20260113070806.189718-1-sobin.thomas@intel.com>
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

--===============7908725471737361399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_evict: overcommit tests for fault-mode and non-fault-mode VMs (rev2)
URL   : https://patchwork.freedesktop.org/series/159996/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17811_full -> IGTPW_14329_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14329_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14329_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14329_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-5/igt@gem_ctx_persistence@engines-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][4] ([i915#3555] / [i915#8228]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_hdr@bpc-switch-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_17811_full and IGTPW_14329_full:

### New IGT tests (1) ###

  * igt@kms_draw_crc@draw-method-mmap-cpu@xbgr16161616f-ytiled:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.19] s

  

Known issues
------------

  Here are the changes found in IGTPW_14329_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_buddy@drm_buddy:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][8] ([i915#15095]) +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@drm_buddy@drm_buddy.html

  * igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][9] ([i915#15095]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7697]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#8562])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][21] ([i915#11713])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3281]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4537] / [i915#4812]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][24] ([i915#13356]) +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#14544] / [i915#4613])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#4613]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#4613]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#4613]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3282])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#284])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4077])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-7/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4083])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3282]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#3282]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#14544] / [i915#3282]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3282]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4270])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#5190] / [i915#8428]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4885])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3297]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#3297]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][48] ([i915#13356] / [i915#14586])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#2527] / [i915#2856]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#2527] / [i915#2856])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#2527]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#14118])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#6412])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#8399]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#8399])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][56] -> [INCOMPLETE][57] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#14544] / [i915#6590]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][59] ([i915#13356] / [i915#15172])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#11681] / [i915#6621])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][61] -> [SKIP][62] ([i915#7984])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-8/igt@i915_power@sanity.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#6245])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#6245])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][65] -> [INCOMPLETE][66] ([i915#4817])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk6/igt@i915_suspend@debugfs-reader.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [PASS][67] -> [INCOMPLETE][68] ([i915#4817])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][70] ([i915#4817]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#14544] / [i915#7707])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#7707])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#5190])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][75] ([i915#12761]) +1 other test incomplete
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#1769] / [i915#3555])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][77]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4538] / [i915#5286]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#5286]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][80] +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#5286]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#5286]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4538] / [i915#5190]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3638]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][85] +48 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#6095]) +52 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#6095]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#14544] / [i915#6095]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#12313] / [i915#14544])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#10307] / [i915#6095]) +126 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#6095]) +49 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#12313])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#12313])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#6095]) +29 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#10307] / [i915#10434] / [i915#6095])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#6095]) +76 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#14098] / [i915#6095]) +55 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#12805])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#12805])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#12313]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#6095]) +199 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#12313]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3742])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3742])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11151] / [i915#7828]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#11151] / [i915#7828]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#11151] / [i915#7828])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#11151] / [i915#7828]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#11151] / [i915#14544] / [i915#7828])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#11151] / [i915#7828]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#11151] / [i915#7828]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#15523]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#15523])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-hdmi-a-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#15523]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-1.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#14544] / [i915#15523]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#15523]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-4.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#6944] / [i915#7118] / [i915#9424])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#6944])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#15330])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#15330] / [i915#3299])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#15330])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#15330])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#15330] / [i915#3116]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#6944] / [i915#7118])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_content_protection@srm.html
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#6944] / [i915#7116] / [i915#7118])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#6944]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#6944] / [i915#7118] / [i915#9424])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#6944] / [i915#7116] / [i915#9424])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3555] / [i915#6944] / [i915#9424])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#3555]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#13049]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][135] -> [FAIL][136] ([i915#13566]) +1 other test fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3555]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#13049])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#8814])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          NOTRUN -> [FAIL][140] ([i915#13566]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][141] ([i915#12358] / [i915#14152] / [i915#7882])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][142] ([i915#12358] / [i915#14152])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#4103]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#4103]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#14544]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#13046] / [i915#5354]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] +15 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][148] -> [FAIL][149] ([i915#2346])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#4103])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#9723])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#13691])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#1769] / [i915#3555] / [i915#3804])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3804])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3804])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][156] -> [SKIP][157] ([i915#1257])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_dp_aux_dev.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#13749])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#13748])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#13748])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3840]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3840])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#3840])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3840] / [i915#9053])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3955]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#3469])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#9337])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#658])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3637] / [i915#9934]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#14544] / [i915#9934])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#9934])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][172] ([i915#12314] / [i915#12745] / [i915#4839])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][173] ([i915#12314] / [i915#4839])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9934]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_flip@2x-plain-flip.html
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3637] / [i915#9934]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][176] ([i915#13027]) +1 other test fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#2587] / [i915#2672]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#2672] / [i915#3555])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#2672] / [i915#3555] / [i915#5190])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#2672]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#2672]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#2672] / [i915#3555]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1825]) +45 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][187] +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#1825])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][189] -> [FAIL][190] ([i915#15389] / [i915#6880])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#8708]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#5439])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#15102]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#15102] / [i915#3458]) +6 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][195] +204 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8708]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#14544] / [i915#15102] / [i915#3023]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#5439])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#15102]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#15102]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#15102]) +20 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#15102] / [i915#3458]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#15102] / [i915#3023]) +23 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#15102]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#8708])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#5354]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#14544] / [i915#1825]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_hdr@static-toggle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8228]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [PASS][211] -> [SKIP][212] ([i915#3555] / [i915#8228])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#15460])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][214] -> [SKIP][215] ([i915#15459])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#15458])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#6301])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#14712]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#13958])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#13958])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#13958])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#14259] / [i915#14544])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#14259])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#14259])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-snb:          NOTRUN -> [SKIP][226] +29 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-snb6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#15329]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][228] +333 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#15329]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#15329] / [i915#6953])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#15329]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#5354])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#5354])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#9812])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9685])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9685])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9685])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#14544] / [i915#9685])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [PASS][239] -> [DMESG-WARN][240] ([i915#4423])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@kms_pm_rpm@i2c.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-19/igt@kms_pm_rpm@i2c.html
    - shard-glk:          NOTRUN -> [FAIL][241] ([i915#8717])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][242] -> [SKIP][243] ([i915#15073])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#15073])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#15073]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][246] -> [SKIP][247] ([i915#15073])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][248] ([i915#14419])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#6524]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][250] ([i915#11520]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-snb6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#12316])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#11520]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#11520]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#11520] / [i915#14544])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#11520]) +14 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][256] ([i915#11520]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk10:        NOTRUN -> [SKIP][257] ([i915#11520]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#11520]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#11520]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#1072] / [i915#9732]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#9732]) +15 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#9688]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-8/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#9732]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#1072] / [i915#9732]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#1072] / [i915#9732]) +28 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][267] ([i915#15500])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#5289])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][270] ([i915#13179]) +1 other test abort
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#8623])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][272] -> [ABORT][273] ([i915#15132]) +3 other tests abort
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][274] ([i915#12276]) +1 other test incomplete
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#11920])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_vrr@lobf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#11920])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9906])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_vrr@max-min.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#2435])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [PASS][279] -> [FAIL][280] ([i915#4349]) +4 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [FAIL][281] ([i915#14433])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#8516])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][283] ([i915#13356])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#3291] / [i915#3708])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#14544] / [i915#3708])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#9917]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][287] ([i915#12910]) +9 other tests fail
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#14544] / [i915#9917])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][289] +17 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][290] ([i915#13390]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [FAIL][292] -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][294] ([i915#13356]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk9/igt@gem_workarounds@suspend-resume-context.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [DMESG-WARN][296] ([i915#14545]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@i915_module_load@resize-bar.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][298] ([i915#12964]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg1:          [DMESG-WARN][300] ([i915#4391] / [i915#4423]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@i915_pm_rpm@reg-read-ioctl.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [ABORT][302] ([i915#15131]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-mtlp:         [FAIL][304] ([i915#5138]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][306] ([i915#13566]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][308] ([i915#13566]) -> [PASS][309] +3 other tests pass
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][310] ([i915#3555]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][312] ([i915#3555] / [i915#8228]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg1:          [DMESG-WARN][314] ([i915#4423]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][316] ([i915#15073]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          [SKIP][318] ([i915#15073]) -> [PASS][319] +1 other test pass
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [FAIL][320] ([i915#15520]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-7/igt@perf_pmu@most-busy-idle-check-all.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [FAIL][322] ([i915#15520]) -> [PASS][323] +1 other test pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [FAIL][324] ([i915#15520]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][326] ([i915#3555] / [i915#9323]) -> [SKIP][327] ([i915#14544] / [i915#3555] / [i915#9323])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][328] ([i915#14544] / [i915#9323]) -> [SKIP][329] ([i915#9323])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][330] ([i915#14544] / [i915#6335]) -> [SKIP][331] ([i915#6335])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          [SKIP][332] ([i915#14544] / [i915#4525]) -> [SKIP][333] ([i915#4525])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          [SKIP][334] ([i915#4525]) -> [SKIP][335] ([i915#14544] / [i915#4525])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-rkl:          [SKIP][336] ([i915#3281]) -> [SKIP][337] ([i915#14544] / [i915#3281]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_exec_reloc@basic-wc-noreloc.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-rkl:          [SKIP][338] ([i915#14544] / [i915#3281]) -> [SKIP][339] ([i915#3281]) +5 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][340] ([i915#7276]) -> [SKIP][341] ([i915#14544] / [i915#7276])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][342] ([i915#4613]) -> [SKIP][343] ([i915#14544] / [i915#4613]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-rkl:          [SKIP][344] ([i915#3282]) -> [SKIP][345] ([i915#14544] / [i915#3282])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-display.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][346] ([i915#14544] / [i915#3282]) -> [SKIP][347] ([i915#3282])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_pread@exhaustion.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][348] ([i915#3282] / [i915#3297]) -> [SKIP][349] ([i915#14544] / [i915#3282] / [i915#3297])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-rkl:          [SKIP][350] ([i915#2527]) -> [SKIP][351] ([i915#14544] / [i915#2527]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@gen9_exec_parse@basic-rejected.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][352] ([i915#14544] / [i915#2527]) -> [SKIP][353] ([i915#2527]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][354] ([i915#1769] / [i915#3555]) -> [SKIP][355] ([i915#14544] / [i915#1769] / [i915#3555])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][356] ([i915#5286]) -> [SKIP][357] ([i915#14544] / [i915#5286]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          [SKIP][358] ([i915#3638]) -> [SKIP][359] ([i915#3638] / [i915#4423])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][360] ([i915#14544] / [i915#3638]) -> [SKIP][361] ([i915#3638]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][362] ([i915#14098] / [i915#6095]) -> [SKIP][363] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][364] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][365] ([i915#14098] / [i915#6095]) +7 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][366] ([i915#14544] / [i915#6095]) -> [SKIP][367] ([i915#6095]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][368] ([i915#6095]) -> [SKIP][369] ([i915#14544] / [i915#6095]) +6 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          [SKIP][370] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][371] ([i915#11151] / [i915#7828]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][372] ([i915#11151] / [i915#7828]) -> [SKIP][373] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          [SKIP][374] ([i915#15523]) -> [SKIP][375] ([i915#14544] / [i915#15523])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-dg2:          [SKIP][376] ([i915#6944]) -> [FAIL][377] ([i915#7173])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-6/igt@kms_content_protection@uevent-hdcp14.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][378] ([i915#13049] / [i915#14544]) -> [SKIP][379] ([i915#13049])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][380] ([i915#14544]) -> [SKIP][381] +7 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][382] ([i915#4103]) -> [SKIP][383] ([i915#14544] / [i915#4103]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][384] ([i915#13748] / [i915#14544]) -> [SKIP][385] ([i915#13748])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][386] ([i915#3555] / [i915#3840]) -> [SKIP][387] ([i915#14544] / [i915#3555] / [i915#3840])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_dsc@dsc-basic.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][388] ([i915#9337]) -> [SKIP][389] ([i915#14544] / [i915#9337])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          [SKIP][390] ([i915#9934]) -> [SKIP][391] ([i915#14544] / [i915#9934])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][392] ([i915#14544] / [i915#9934]) -> [SKIP][393] ([i915#9934]) +5 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][394] ([i915#2672] / [i915#3555]) -> [SKIP][395] ([i915#14544] / [i915#2672] / [i915#3555])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][396] ([i915#2672]) -> [SKIP][397] ([i915#14544] / [i915#2672])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][398] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][399] ([i915#2672] / [i915#3555]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#2672]) -> [SKIP][401] ([i915#2672]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][402] -> [SKIP][403] ([i915#14544]) +9 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][404] ([i915#5439]) -> [SKIP][405] ([i915#14544] / [i915#5439])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][406] ([i915#15102]) -> [SKIP][407] ([i915#14544] / [i915#15102])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][408] ([i915#15102] / [i915#3023]) -> [SKIP][409] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][410] ([i915#1825]) -> [SKIP][411] ([i915#14544] / [i915#1825]) +12 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][412] ([i915#14544] / [i915#1825]) -> [SKIP][413] ([i915#1825]) +14 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][414] ([i915#15102] / [i915#3458]) -> [SKIP][415] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][417] ([i915#15102] / [i915#3023]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2:          [SKIP][418] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][419] ([i915#15102] / [i915#3458]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][420] ([i915#1187] / [i915#12713]) -> [SKIP][421] ([i915#12713])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][422] ([i915#14544] / [i915#4281]) -> [SKIP][423] ([i915#4281])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][424] ([i915#8430]) -> [SKIP][425] ([i915#14544] / [i915#8430])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@package-g7:
    - shard-dg1:          [SKIP][426] ([i915#12916]) -> [SKIP][427] ([i915#15403])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@kms_pm_rpm@package-g7.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][428] ([i915#6524]) -> [SKIP][429] ([i915#14544] / [i915#6524])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][430] ([i915#11520]) -> [SKIP][431] ([i915#11520] / [i915#14544]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][432] ([i915#11520] / [i915#14544]) -> [SKIP][433] ([i915#11520]) +3 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][434] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][435] ([i915#1072] / [i915#9732]) +7 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          [SKIP][436] ([i915#1072] / [i915#9732]) -> [SKIP][437] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][438] ([i915#9685]) -> [SKIP][439] ([i915#14544] / [i915#9685])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][440] ([i915#14544] / [i915#3555]) -> [SKIP][441] ([i915#3555]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#8623]) -> [SKIP][443] ([i915#8623])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          [SKIP][444] ([i915#15243] / [i915#3555]) -> [SKIP][445] ([i915#14544] / [i915#15243] / [i915#3555])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_vrr@flipline.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_vrr@flipline.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520
  [i915#15523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8699 -> IGTPW_14329
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17811: 868ad9166fa094185c18c3343d7944ff2171f9d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14329: 14329
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/index.html

--===============7908725471737361399==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_evict: overcommit tests for fault-mode and non-fault-mode VMs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159996/">https://patchwork.freedesktop.org/series/159996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17811_full -&gt; IGTPW_14329_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14329_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14329_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14329_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-5/igt@gem_ctx_persistence@engines-mixed-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@gem_ctx_persistence@engines-mixed-process.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@bpc-switch-suspend:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_17811_full and IGTPW_14329_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_draw_crc@draw-method-mmap-cpu@xbgr16161616f-ytiled:<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.19] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14329_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@drm_buddy@drm_buddy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-7/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk9/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-8/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +199 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389">i915#15389</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +204 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-snb6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> +333 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-19/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717">i915#8717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-snb6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-14/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-7/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-8/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-8/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-glk9/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-glk6/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@i915_module_load@resize-bar.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@i915_module_load@resize-bar.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@i915_pm_rpm@reg-read-ioctl.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-7/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-3/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> +1 other test pass</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-mtlp-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15520">i915#15520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_exec_reloc@basic-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_reloc@basic-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gem_pread@exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@gem_pread@exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15523">i915#15523</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-6/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-11/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-dg1-17/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-dg1-12/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17811/shard-rkl-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14329/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8699 -&gt; IGTPW_14329</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17811: 868ad9166fa094185c18c3343d7944ff2171f9d3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14329: 14329<br />
  IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7908725471737361399==--
