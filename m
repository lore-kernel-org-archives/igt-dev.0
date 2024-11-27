Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3BBD6ACC4
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 12:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586E110E04F;
	Wed, 27 Nov 2024 12:51:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A757410E04F;
 Wed, 27 Nov 2024 12:51:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/gem=5Fctx=5F?=
 =?utf-8?q?persistence=3A_Wait_for_context_termination_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 12:51:37 -0000
Message-ID: <173271189767.3737589.17812959772718739992@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
In-Reply-To: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
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

Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev4)
URL   : https://patchwork.freedesktop.org/series/140582/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15751_full -> IGTPW_12205_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12205_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12205_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12205_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled@lmem0:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_render_copy@y-tiled-ccs-to-y-tiled@lmem0.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk3/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-rkl:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@i915_pm_rpm@debugfs-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-5/igt@i915_suspend@debugfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-edp1:
    - shard-mtlp:         NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_flip@flip-vs-panning-vs-hang@d-edp1.html

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-mtlp:         [PASS][15] -> [ABORT][16] +2 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-8/igt@perf_pmu@busy-hang@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@perf_pmu@busy-hang@rcs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-mtlp:         [SKIP][17] ([i915#3297]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][19] ([i915#12713]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@kms_hdr@brightness-with-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [DMESG-FAIL][21] ([i915#12964]) -> [INCOMPLETE][22] +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][23] ([i915#9519]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  
Known issues
------------

  Here are the changes found in IGTPW_12205_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - shard-dg2:          [PASS][25] -> [SKIP][26] +16 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@api_intel_allocator@two-level-inception-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@api_intel_allocator@two-level-inception-interruptible.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8411])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8411]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#8411]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#8411])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@core_getversion@all-cards:
    - shard-dg2:          [PASS][31] -> [FAIL][32] ([i915#12869])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-7/igt@core_getversion@all-cards.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          NOTRUN -> [ABORT][33] ([i915#11703])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb1/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [PASS][34] -> [FAIL][35] ([i915#13068])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-2/igt@core_setmaster@master-drop-set-user.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#9318])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#11078])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#11078])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#11078])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#8414]) +12 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8414]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#2582])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#7697])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4873])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gem_caching@writes.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3555] / [i915#9323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#9323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#13008])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#13008])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#13008])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#13008])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][52] -> [INCOMPLETE][53] ([i915#7297])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#7697]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#6335])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#6335])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#8562])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#8555]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#8555])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#8555]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-mtlp:         NOTRUN -> [FAIL][61] ([i915#11980] / [i915#12580])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][62] ([i915#1099]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#280])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#280])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][65] ([i915#5784])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4812])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4771])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [FAIL][68] ([i915#6117])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#6344])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#6344])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][71] ([i915#11965] / [i915#12558]) +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4812]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3539] / [i915#4852]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3539] / [i915#4852]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3281]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3281]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3281]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3281]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4537] / [i915#4812])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4537] / [i915#4812])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#2575]) +98 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][83] +158 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb7/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4860])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4860]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4860]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#2190])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4613]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#4613]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#4613])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2:          [PASS][91] -> [SKIP][92] ([i915#12936])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-2/igt@gem_lmem_swapping@smem-oom.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][93] ([i915#4613]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#284])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#284])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4077]) +15 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4077]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4077]) +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@coherency:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4083]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4083]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4083]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3282]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3282])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][105] ([i915#2658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         [PASS][106] -> [SKIP][107] ([i915#4270]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-tglu-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#13033])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4270]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4270]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#4270])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#4270])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3282]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#8428]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#5190] / [i915#8428]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4079]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#4079])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4079]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3297]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3297]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3297]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#3297]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3297]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-18/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#3297])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3281] / [i915#3297])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@gem_userptr_blits@relocations.html

  * igt@gem_wait@await:
    - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#2575]) +113 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-2/igt@gem_wait@await.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@gem_wait@await.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#2527]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#2527] / [i915#2856]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#2527]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#2856]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#2527] / [i915#2856]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#2856]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][134] -> [ABORT][135] ([i915#9820])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7091])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#8436])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#8399])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#8399])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#8399])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg2:          [PASS][141] -> [SKIP][142] ([i915#13014]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-8/igt@i915_pm_rpm@debugfs-read.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#13014])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][144] -> [INCOMPLETE][145] ([i915#7790])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb2/igt@i915_pm_rps@reset.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#11681])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#11681])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#6188])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#5723])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [ABORT][150] ([i915#13010]) +1 other test abort
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][151] ([i915#12964] / [i915#4817])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][152] ([i915#7443])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#6645])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#7707])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#2575] / [i915#5190]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4212])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#4212])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#8709]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#8709]) +11 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#9531])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#9531])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#9531])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#1769]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#1769] / [i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#1769] / [i915#3555])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#1769] / [i915#3555])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#1769] / [i915#3555]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#5286]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5286]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#5286]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#5286]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#5286]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3638]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3638]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6187])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5190]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4538] / [i915#5190]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4538]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][179] +18 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][180] +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#6095]) +172 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#6095]) +89 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][183] +54 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#12313]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#12313]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#6095]) +112 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#10307] / [i915#6095]) +114 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#12313])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#12313])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#12313]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#12805])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#6095]) +34 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#12805])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][194] -> [DMESG-FAIL][195] ([i915#12964]) +1 other test dmesg-fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][196] ([i915#12964])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#6095]) +20 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#6095]) +59 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][200] +324 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#7828]) +9 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#7828]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#7828]) +11 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#7828]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#7828]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#7828]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#6944] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3299])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][210] ([i915#7173]) +1 other test timeout
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#9424])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_content_protection@mei-interface.html
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#6944] / [i915#9424])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#9433])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#7118])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_content_protection@srm.html
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#6944] / [i915#7116] / [i915#7118])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#7118] / [i915#9424])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#7118] / [i915#9424]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#7116] / [i915#9424])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-18/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#6944] / [i915#9424])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#13049])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8814])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8814]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#13049]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#13049])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#13049])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#13049]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#13049])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][230] ([i915#12964]) +11 other tests dmesg-warn
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#9809]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#4213])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#4103] / [i915#4213])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#4103])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#9723])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][236] ([i915#12170])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][237] ([i915#11968])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#8588])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#3804])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#1769] / [i915#3555] / [i915#3804])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#3804])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3804])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#1257])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-6/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8812])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3840] / [i915#9688])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#1839])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#9337])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9337])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#658])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#658])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#4881])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#9934]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3637]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#3637]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#3637]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#9934]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#9934]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][258] -> [DMESG-WARN][259] ([i915#12917] / [i915#12964])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-1/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][260] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-vga1:
    - shard-snb:          [PASS][261] -> [FAIL][262] ([i915#11989]) +1 other test fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-vga1.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb7/igt@kms_flip@blocking-wf_vblank@a-vga1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#8381])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#8381])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8381])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][266] ([i915#4839] / [i915#6113])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][267] -> [DMESG-WARN][268] ([i915#4423]) +2 other tests dmesg-warn
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][269] ([i915#4423]) +3 other tests dmesg-warn
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend@d-edp1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][270] ([i915#6113]) +1 other test incomplete
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@kms_flip@flip-vs-suspend@d-edp1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][271] ([i915#6113])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [FAIL][272] ([i915#11989]) +1 other test fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#2672] / [i915#3555]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#2587] / [i915#2672]) +7 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#2587] / [i915#2672]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#2587] / [i915#2672] / [i915#3555])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#2587] / [i915#2672] / [i915#3555])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#2587] / [i915#2672])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#2672] / [i915#8813]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#2672] / [i915#3555]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#2672]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#2672]) +9 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#2672] / [i915#3555] / [i915#8813]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#8708]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [PASS][288] -> [SKIP][289] +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#8708]) +15 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1825]) +22 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3458]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#3023]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][294] +49 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] +31 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#1825]) +22 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#10433] / [i915#3458]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#10055])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#9766])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][300] +113 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8708]) +23 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#5354]) +32 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#3458]) +26 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12713])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#10656])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#10656])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#12388])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#12394])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#12339])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#3555] / [i915#8821])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#3555]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#3555]) +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#3555]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8806])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8806])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#12247]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#12247] / [i915#6953] / [i915#9423])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12247] / [i915#9423])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12247]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#12247]) +9 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#12247]) +9 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#12247]) +11 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#12247]) +9 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-dg2:          [PASS][327] -> [SKIP][328] ([i915#2575] / [i915#9423]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#2575] / [i915#9423]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9812])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#5354]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12343])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#9812])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#3828])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#3828])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [FAIL][336] ([i915#12913])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#5978])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#3361])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#3828])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#8430])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#9519]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#12937])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-5/igt@kms_pm_rpm@drm-resources-equal.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12937])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#9519])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][346] -> [SKIP][347] ([i915#9519])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][348] -> [SKIP][349] ([i915#9519]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#9519])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#6524])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#6524])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#6524]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#6524])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#6524] / [i915#6805]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#11520]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#11520]) +6 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][358] ([i915#11520]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#9808]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#11520]) +12 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#11520]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#12316]) +7 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#11520]) +10 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][364] ([i915#11520]) +10 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9683])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9683])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#9683]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#4348])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#1072] / [i915#9732]) +11 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#1072] / [i915#9732]) +24 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#9688]) +13 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#9732]) +10 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#4077] / [i915#9688]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-2/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#9732]) +25 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#1072] / [i915#9732]) +24 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#9685])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#5289])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#5289]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#5289]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#12755])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][381] ([IGT#160])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#8623])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#11920])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#9906])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#8808] / [i915#9906])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#9906]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#2437])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#2437])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][389] ([i915#2437]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-glk1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#7387])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@perf@global-sseu-config.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][391] ([i915#9100])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][392] -> [DMESG-WARN][393] ([i915#12964]) +45 other tests dmesg-warn
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-3/igt@perf@polling@0-rcs0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@perf@polling@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#2433])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#12506]) +6 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][396] -> [FAIL][397] ([i915#4349]) +1 other test fail
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-8/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][398] ([i915#4349]) +3 other tests fail
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#8850])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@invalid-init:
    - shard-dg2:          [PASS][400] -> [SKIP][401] ([i915#12506]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-10/igt@perf_pmu@invalid-init.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-11/igt@perf_pmu@invalid-init.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#8516]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#8516])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-3/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#3708]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#3708] / [i915#4077])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#3708]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-4/igt@prime_vgem@fence-read-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#3708]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-3/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#3708])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-17/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#9917])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#9917])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#9917])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-mtlp:         NOTRUN -> [FAIL][412] ([i915#12910]) +9 other tests fail
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-mtlp-7/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][413] ([i915#12910])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#4818])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@memory-info-idle:
    - shard-dg2:          [SKIP][415] ([i915#12506]) -> [PASS][416] +7 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@drm_fdinfo@memory-info-idle.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@drm_fdinfo@memory-info-idle.html

  * igt@fbdev@pan:
    - shard-dg2:          [SKIP][417] ([i915#2582]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@fbdev@pan.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-5/igt@fbdev@pan.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [ABORT][419] -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][421] ([i915#12714] / [i915#5784]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg1-13/igt@gem_eio@unwedge-stress.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [SKIP][423] ([i915#12936]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          [DMESG-WARN][425] ([i915#12917] / [i915#12964]) -> [PASS][426] +2 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-2/igt@gem_mmap_gtt@medium-copy-odd.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-7/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [PASS][428] +128 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-dg2-10/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][429] ([i915#12964]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][431] ([i915#9820]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][433] ([i915#10887] / [i915#12817] / [i915#9820]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][435] ([i915#12942]) -> [PASS][436] +1 other test pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15751/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-dg2:          [SKIP][437] ([i915#13014]) -> [PASS][438] +1 other test pass
   [4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12205/index.html
