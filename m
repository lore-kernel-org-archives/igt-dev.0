Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E764D1BDC2
	for <igt-dev@archiver.kernel.org>; Sat, 23 Nov 2024 13:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FC110E22B;
	Sat, 23 Nov 2024 13:39:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03610E22B;
 Sat, 23 Nov 2024 13:39:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Skip_test_if_joiner_disp?=
 =?utf-8?q?lay_is_connected?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Nov 2024 13:39:46 -0000
Message-ID: <173236918650.2102259.4188835853678042419@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120174345.1970095-1-jeevan.b@intel.com>
In-Reply-To: <20241120174345.1970095-1-jeevan.b@intel.com>
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

Series: Skip test if joiner display is connected
URL   : https://patchwork.freedesktop.org/series/141614/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15724_full -> IGTPW_12149_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12149_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12149_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12149_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_eio@kms:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@gem_eio@kms.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_lmem_evict@dontneed-evict-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@i915_selftest@live:
    - shard-dg1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-17/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [PASS][7] -> [ABORT][8] +2 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-9/igt@i915_selftest@live@sanitycheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-tglu-1:       NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][12] +14 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][13] -> [DMESG-FAIL][14] +3 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-14/igt@kms_hdmi_inject@inject-audio.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-rkl:          [PASS][21] -> [DMESG-WARN][22] +42 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][23] +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  
#### Warnings ####

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][24] ([i915#4270]) -> [TIMEOUT][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][26] ([i915#12964]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          [FAIL][28] ([i915#12941]) -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb5/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [ABORT][30] -> [DMESG-WARN][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@i915_module_load@reload-no-display.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          [SKIP][32] ([i915#5354]) -> [SKIP][33] +10 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          [SKIP][34] ([i915#2575]) -> [SKIP][35] +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][36] +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_12149_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [PASS][37] -> [SKIP][38] +30 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@api_intel_allocator@default-alignment.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#6230])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#6230])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8414]) +26 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#8414]) +23 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#12506]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-dg2:          [PASS][44] -> [SKIP][45] ([i915#12506]) +7 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-7/igt@drm_fdinfo@virtual-idle.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#3555] / [i915#9323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][47] -> [INCOMPLETE][48] ([i915#12392] / [i915#7297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#8562])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@execute-one:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#2575]) +96 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_ctx_engines@execute-one.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][51] ([i915#1099]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#8555])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][53] ([i915#11980] / [i915#12580])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#5882]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#280])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][56] ([i915#10030] / [i915#7975] / [i915#8213])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][57] ([i915#5784])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4771]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#6344])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4812]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4812])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3539] / [i915#4852]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3281]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3281]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3281]) +14 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4537] / [i915#4812]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][69] ([i915#11441]) +1 other test incomplete
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          NOTRUN -> [ABORT][70] ([i915#7975] / [i915#8213]) +1 other test abort
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
    - shard-dg2:          NOTRUN -> [ABORT][71] ([i915#7975] / [i915#8213])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4860]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4860])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4613] / [i915#7582])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#12936])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4565]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#4613])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][78] ([i915#4613])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4613]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#12193]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4613]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [PASS][82] -> [SKIP][83] ([i915#12936]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@gem_lmem_swapping@verify-random.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#284])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +16 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +10 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4083])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@gem_mmap_wc@close.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3282]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][92] ([i915#2658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         [PASS][93] -> [SKIP][94] ([i915#4270])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-4/igt@gem_pxp@create-valid-protected-context.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#12975])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][96] ([i915#12917])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4270]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4270]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2575] / [i915#5190]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4079])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4885])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4879])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297] / [i915#3323])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#3323])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#3297]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#12961])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@gem_watchdog@default-virtual.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#2527])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#2527] / [i915#2856]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#2527] / [i915#2856]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4881])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@i915_fb_tiling.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#7178])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#6412])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#8399])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][123] -> [FAIL][124] ([i915#12942]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][125] ([i915#2681]) +1 other test warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#11681] / [i915#6621]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][127] ([i915#9311])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][128] -> [FAIL][129] ([i915#12867]) +4 other tests fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@i915_selftest@perf.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#7707])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4212]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          [PASS][132] -> [SKIP][133] ([i915#2575] / [i915#5190])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-glk:          NOTRUN -> [FAIL][134] ([i915#10991] / [i915#12766])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][135] ([i915#10991])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#8709]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          [PASS][137] -> [INCOMPLETE][138] ([i915#9878])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@kms_async_flips@crc.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#1769] / [i915#3555])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#1769] / [i915#3555])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#1769] / [i915#3555])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#5286]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#5286])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5286]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#5286])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538] / [i915#5286]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3638]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#5190]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][150] +11 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][151] +102 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][153] +100 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#6095]) +170 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#12313])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#6095]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#12313]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#12313])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12805])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6095]) +74 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +17 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#6095]) +58 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#10307] / [i915#6095]) +147 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3742])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#11616] / [i915#7213])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#7828]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#7828])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7828]) +9 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7828]) +15 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#7828]) +13 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3116] / [i915#3299]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3299]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7116])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#7116] / [i915#9424]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#3555]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#12976])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12976]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12976])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#12976]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-rkl:          [PASS][184] -> [DMESG-WARN][185] ([i915#12964]) +1 other test dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#5354]) +26 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#4103] / [i915#4213]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [PASS][188] -> [FAIL][189] ([i915#2346])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9067])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#9067])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#1769] / [i915#3555] / [i915#3804])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#3804])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#1257])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3555] / [i915#3840])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#3469])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3469]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#4881])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#9934]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#3637]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8381])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3637]) +5 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][208] -> [FAIL][209] ([i915#2122]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#9934]) +12 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][211] ([i915#2122]) +2 other tests fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8381])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][213] -> [DMESG-WARN][214] ([i915#4423]) +1 other test dmesg-warn
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][215] ([i915#4423]) +1 other test dmesg-warn
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#2672]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#2672]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672] / [i915#3555]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][227] -> [FAIL][228] ([i915#6880])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1825]) +10 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][230] +62 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] +29 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][232] +48 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#9766])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3458]) +11 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8708]) +29 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3023]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8708]) +14 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3458]) +24 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [PASS][239] -> [SKIP][240] ([i915#2575]) +136 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@kms_getfb@getfb-handle-closed.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [PASS][241] -> [SKIP][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb2/igt@kms_hdmi_inject@inject-audio.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228]) +4 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@kms_hdr@invalid-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@kms_hdr@static-swap.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#12388])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#12394])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#6301]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#6301])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#6301])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][256] ([i915#12169])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][257] ([i915#10647]) +1 other test fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          [PASS][258] -> [DMESG-WARN][259] ([i915#12917])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@kms_plane_cursor@viewport.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8821])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#6953])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2575] / [i915#9423]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#12247]) +17 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [PASS][264] -> [SKIP][265] ([i915#2575] / [i915#9423]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#12247]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12247] / [i915#6953] / [i915#9423])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#6953])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247] / [i915#6953]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247] / [i915#6953])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#12247]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#12247]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#12343])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12343])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][276] +71 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb6/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9812])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#5354]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#9685])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#9685])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#9340])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#8430])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][283] -> [SKIP][284] ([i915#9519])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12937]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#9519]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#9519]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#9519]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#11520]) +6 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11520]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#11520]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#11520]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-snb:          NOTRUN -> [SKIP][294] ([i915#11520])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb1/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#11520]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#11520]) +9 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#9683])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#1072] / [i915#9732]) +9 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_psr@pr-sprite-render.html
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#9732]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9732]) +27 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +16 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#1072] / [i915#9732]) +35 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#5289])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#12755] / [i915#5190]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#3555]) +9 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#3555]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][307] -> [FAIL][308] ([i915#5465]) +2 other tests fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@kms_setmode@basic.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_setmode@basic.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9906]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9906]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#9906])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#3555] / [i915#9906])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#9906])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#2437])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2437] / [i915#9412])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#2437] / [i915#9412])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][317] ([i915#2437])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#2437]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-13/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#7387])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@perf@global-sseu-config-invalid.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#2435])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#2433])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][322] -> [FAIL][323] ([i915#4349]) +4 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][324] ([i915#12549] / [i915#6806]) +1 other test fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][325] -> [FAIL][326] ([i915#4349]) +1 other test fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#8516])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#8516])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#8516])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#8516])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#3291] / [i915#3708]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#3708] / [i915#4077]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#9917])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#9917]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][335] ([i915#12910]) +19 other tests fail
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][336] ([i915#12910]) +8 other tests fail
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [PASS][337] -> [FAIL][338] ([i915#12875])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@tools_test@tools_test.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@tools_test@tools_test.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [FAIL][339] ([i915#12869]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@core_getversion@all-cards.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@core_getversion@all-cards.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][341] ([i915#2582]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@fbdev@nullptr.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@fbdev@nullptr.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][343] ([i915#12031]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglu:         [FAIL][345] ([i915#12031]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][347] ([i915#11980] / [i915#12580]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-5/igt@gem_ctx_persistence@hostile.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-dg2:          [SKIP][349] ([i915#12936]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_lmem_swapping@parallel-random-engines.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         [SKIP][351] ([i915#4270]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-9/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][353] ([i915#12941]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][355] ([i915#2575]) -> [PASS][356] +112 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@gem_vm_create@execbuf.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [FAIL][357] ([i915#12739] / [i915#3591]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-rkl:          [SKIP][359] ([i915#12964]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-2/igt@i915_pm_rpm@sysfs-read.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][361] -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2:          [FAIL][363] ([i915#10991] / [i915#12766]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [FAIL][365] ([i915#5956]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [SKIP][367] -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][369] ([i915#12402]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2:          [FAIL][371] ([i915#2122]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg1:          [FAIL][373] ([i915#12517] / [i915#2122]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [FAIL][375] ([i915#2122]) -> [PASS][376] +7 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][377] ([i915#2122]) -> [PASS][378] +5 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-snb5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][379] -> [PASS][380] +16 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][381] ([i915#12964]) -> [PASS][382] +35 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          [SKIP][383] ([i915#2575] / [i915#9423]) -> [PASS][384] +3 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][385] ([i915#9295]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][387] ([i915#4281]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][389] ([i915#9340]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][391] ([i915#9519]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][393] ([i915#12937]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@kms_pm_rpm@dpms-non-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [FAIL][395] ([i915#8717]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@kms_pm_rpm@i2c.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [DMESG-WARN][397] ([i915#12917]) -> [PASS][398] +4 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-3/igt@kms_vblank@query-forked-hang.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-3/igt@kms_vblank@query-forked-hang.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][399] ([i915#10538] / [i915#12664]) -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-3/igt@perf@blocking@0-rcs0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-7/igt@perf@blocking@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [SKIP][401] ([i915#12506]) -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][403] -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-tglu-10/igt@perf_pmu@module-unload.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-tglu-2/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [SKIP][405] -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-rkl-1/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-gt0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][407] ([i915#2575]) -> [SKIP][408] ([i915#8411])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-hang:
    - shard-dg2:          [SKIP][409] ([i915#8414]) -> [SKIP][410] ([i915#12506]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@drm_fdinfo@busy-hang.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@drm_fdinfo@busy-hang.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][411] ([i915#12506]) -> [SKIP][412] ([i915#8414]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][413] ([i915#2575]) -> [SKIP][414] ([i915#3936])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_busy@semaphore.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@gem_busy@semaphore.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          [SKIP][415] ([i915#7697]) -> [SKIP][416] ([i915#2575]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [SKIP][417] ([i915#2575]) -> [ABORT][418] ([i915#9846])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][419] ([i915#2575]) -> [SKIP][420] ([i915#8562])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [INCOMPLETE][421] ([i915#12353]) -> [SKIP][422] ([i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-1/igt@gem_ctx_isolation@preservation-s3.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [SKIP][423] ([i915#2575]) -> [FAIL][424] ([i915#11980] / [i915#12580])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#280])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [FAIL][427] ([i915#12714] / [i915#5784]) -> [SKIP][428] ([i915#2575])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-3/igt@gem_eio@unwedge-stress.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [SKIP][430] ([i915#4812]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][431] ([i915#2575]) -> [SKIP][432] ([i915#4771])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][433] ([i915#4812]) -> [SKIP][434] ([i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-2/igt@gem_exec_balancer@bonded-semaphore.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          [SKIP][435] ([i915#8555]) -> [SKIP][436] ([i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][437] ([i915#3539] / [i915#4852]) -> [SKIP][438] ([i915#2575]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-4/igt@gem_exec_flush@basic-uc-pro-default.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          [SKIP][439] ([i915#2575]) -> [SKIP][440] ([i915#3539] / [i915#4852])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_flush@basic-wb-rw-before-default.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-10/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          [SKIP][441] ([i915#3281]) -> [SKIP][442] ([i915#2575]) +4 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][443] ([i915#2575]) -> [SKIP][444] ([i915#3281]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [INCOMPLETE][445] -> [ABORT][446] ([i915#7975] / [i915#8213])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          [SKIP][447] ([i915#2575]) -> [SKIP][448] ([i915#4860])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          [SKIP][449] ([i915#4083]) -> [SKIP][450] ([i915#2575]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-10/igt@gem_mmap@pf-nonblock.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-dg2:          [SKIP][451] ([i915#2575]) -> [SKIP][452] ([i915#4077]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_gtt@big-copy.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-2/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-dg2:          [SKIP][453] ([i915#2575]) -> [SKIP][454] ([i915#4083])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_mmap_wc@set-cache-level.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-8/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          [SKIP][455] ([i915#3282]) -> [SKIP][456] ([i915#2575]) +2 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@uncached:
    - shard-dg2:          [SKIP][457] ([i915#2575]) -> [SKIP][458] ([i915#3282]) +4 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-11/igt@gem_pread@uncached.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg2-5/igt@gem_pread@uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][459] ([i915#4270]) -> [SKIP][460] ([i915#2575]) +3 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15724/shard-dg2-6/igt@gem_pxp@display-protected-crc.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/shard-dg

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12149/index.html
