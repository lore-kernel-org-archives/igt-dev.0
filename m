Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6E5D75E5D
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 20:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E1E10E2C2;
	Sun, 24 Nov 2024 20:16:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9073510E2C1;
 Sun, 24 Nov 2024 20:16:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/igt=5Fkms=3A_Helpers?=
 =?utf-8?q?_for_connector_managment_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 20:16:12 -0000
Message-ID: <173247937260.2568264.4907213741220700669@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
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

Series: lib/igt_kms: Helpers for connector managment (rev3)
URL   : https://patchwork.freedesktop.org/series/137915/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15732_full -> IGTPW_12178_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12178_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12178_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12178_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_eio@kms:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@gem_eio@kms.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-2/igt@i915_module_load@resize-bar.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          [PASS][6] -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-2/igt@i915_pm_rpm@gem-execbuf-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_selftest@live@execlists:
    - shard-dg2:          NOTRUN -> [FAIL][8] +15 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][9] -> [FAIL][10] +23 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@i915_selftest@live@objects.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][13] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-2.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][15] -> [DMESG-FAIL][16] +3 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          [PASS][17] -> [DMESG-WARN][18] +30 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [ABORT][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          [SKIP][20] ([i915#11078]) -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@device_reset@cold-reset-bound.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          [SKIP][22] ([i915#4077]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_selftest@mock:
    - shard-tglu:         [DMESG-WARN][24] ([i915#9311]) -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-7/igt@i915_selftest@mock.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@i915_selftest@mock.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][26] ([i915#2575]) -> [SKIP][27] +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][28] ([i915#9100]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-6/igt@perf@non-zero-reason.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@perf@non-zero-reason.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-plain-flip-ts-check:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][30] +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-9/igt@kms_flip@2x-plain-flip-ts-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_12178_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8411]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#8411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#6230])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@api_intel_bb@crc32.html

  * igt@core_getversion@all-cards:
    - shard-dg2:          [PASS][34] -> [FAIL][35] ([i915#12869])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-2/igt@core_getversion@all-cards.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#11078])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8414])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#7697])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#7697])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][40] ([i915#12392] / [i915#7297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-clear:
    - shard-rkl:          [PASS][41] -> [DMESG-WARN][42] ([i915#12964]) +13 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@gem_create@create-clear.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@gem_create@create-clear.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#6335])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#8562])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][45] -> [FAIL][46] ([i915#9561]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@gem_ctx_freq@sysfs.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#8555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#8555])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][49] ([i915#11980] / [i915#12580])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][50] ([i915#11980] / [i915#12580])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][51] ([i915#1099])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb7/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][52] ([i915#11980] / [i915#12580])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#5882]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#280]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#280]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#280])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][57] -> [ABORT][58] ([i915#7975] / [i915#8213])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-18/igt@gem_eio@hibernate.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][59] ([i915#5784])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4812]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4771])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][62] ([i915#11713])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#6334]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3539])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3539])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3539] / [i915#4852]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3281]) +19 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3281]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3281]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4537] / [i915#4812]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#2575]) +85 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#7276])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4860]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4860]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-5/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#4613]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          [PASS][78] -> [SKIP][79] ([i915#12936]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_lmem_swapping@parallel-random.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][80] ([i915#5493]) +1 other test dmesg-warn
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#12936]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#12193]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#4613]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4565]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4083]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3282]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282]) +9 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4270]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_pxp@create-regular-context-1.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12917])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#12975])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4270]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu:         [PASS][96] -> [SKIP][97] ([i915#4270]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#5190] / [i915#8428]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2575] / [i915#5190]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3282] / [i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2527] / [i915#2856]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#2527]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#2527]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@gen9_exec_parse@bb-secure.html
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#2856]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#2527] / [i915#2856]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][112] ([i915#9820])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][113] ([i915#9820])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#8399]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][115] -> [FAIL][116] ([i915#12942]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          NOTRUN -> [FAIL][117] ([i915#12548] / [i915#3591]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][118] ([i915#12739] / [i915#3591]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@i915_pm_rps@basic-api.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#6188])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][121] -> [SKIP][122] ([i915#2575] / [i915#5190])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#8709]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#8709]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#6228])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#5286])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#5286])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#5286]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5286]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3638]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3638]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5190]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#5190]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][138] +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#6095]) +86 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#12313]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#12313]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6095]) +177 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#6095]) +107 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +94 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#12313]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#6095]) +44 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#6095]) +12 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][150] -> [DMESG-WARN][151] ([i915#4423]) +4 other tests dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#12313]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#11616] / [i915#7213])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3742])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3742]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3742]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#7213]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#7828]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] +40 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#7828]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#7828]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#7828]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][164] +89 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb1/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [TIMEOUT][166] ([i915#7173]) +1 other test timeout
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7116] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#3116] / [i915#3299])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#6944] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-8/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#7116])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#7116] / [i915#7118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#12976]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#12976])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#12976]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#12976])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#12976])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3555]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#4103] / [i915#4213])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#4103] / [i915#4213]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][185] -> [FAIL][186] ([i915#2346])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#4103]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][188] ([i915#12638])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#8588])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#1257])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#1257])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#1257])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#1257])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#12402])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#12402])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3469]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3469])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3955])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3469])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2065] / [i915#4854])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#4854])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#4854])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#4854])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#1839])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#1839])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9337])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#658]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-2/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3637]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9934]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8381]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8381])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#3637]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4423] / [i915#9934])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#9934]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          [PASS][221] -> [FAIL][222] ([i915#79])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][223] ([i915#79])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][224] ([i915#12964]) +4 other tests dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_flip@flip-vs-rmfb@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][225] ([i915#4839] / [i915#6113])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][226] ([i915#6113])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a4:
    - shard-dg1:          [PASS][227] -> [INCOMPLETE][228] ([i915#4839] / [i915#6113]) +1 other test incomplete
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_flip@flip-vs-suspend@d-hdmi-a4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg1:          [PASS][229] -> [FAIL][230] ([i915#11989] / [i915#12517] / [i915#2122])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_flip@plain-flip-ts-check.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_flip@plain-flip-ts-check.html
    - shard-tglu:         [PASS][231] -> [FAIL][232] ([i915#2122]) +3 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@plain-flip-ts-check.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#2122]) +11 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg2:          [PASS][235] -> [FAIL][236] ([i915#2122])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [PASS][237] -> [FAIL][238] ([i915#11989] / [i915#2122])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          [PASS][239] -> [FAIL][240] ([i915#2122]) +1 other test fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][241] ([i915#2122]) +2 other tests fail
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
    - shard-dg1:          NOTRUN -> [FAIL][242] ([i915#2122]) +2 other tests fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [PASS][244] -> [SKIP][245] +24 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672] / [i915#3555])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672] / [i915#3555])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][256] +41 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1825]) +14 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-snb:          [PASS][258] -> [SKIP][259]
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][260] +48 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#8708]) +22 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#5439])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-dg2:          [PASS][263] -> [FAIL][264] ([i915#6880])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8708]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5354]) +28 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#9766])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][268] +100 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3458]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#3023]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#3458]) +20 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#3555] / [i915#8228]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#10656]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12339])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#10656])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#12388])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#6301])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#6301])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#6301])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8806])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][284] ([i915#8292]) +1 other test fail
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#12247]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [PASS][286] -> [SKIP][287] ([i915#2575] / [i915#9423]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#2575] / [i915#9423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12247]) +17 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#12247] / [i915#3555])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#12247] / [i915#3555])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#12247] / [i915#3555] / [i915#9423])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12247] / [i915#3555])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#12247] / [i915#6953] / [i915#9423])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#12247] / [i915#6953]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#12247]) +21 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#12247]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#5354])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9812]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#5354])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#3828])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][303] -> [SKIP][304] ([i915#4281])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#9519])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][306] -> [SKIP][307] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][308] -> [SKIP][309] ([i915#9519])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9519]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][312] -> [SKIP][313] ([i915#12937]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#12937])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#6524])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#2575]) +150 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_prop_blob@blob-prop-validate.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#11520]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][320] ([i915#11520])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#11520])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#11520]) +8 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][323] ([i915#11520]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#11520]) +10 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#9683])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9683]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9683])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +9 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +27 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-18/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#9732]) +30 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-3/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#1072] / [i915#9732]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9732]) +8 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#9685]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#12755]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#5289])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#3555]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3555]) +8 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][338] ([IGT#2] / [i915#6493])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#8623]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#9906])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#11920])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#11920])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9906]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [PASS][344] -> [SKIP][345] ([i915#3555] / [i915#9906])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@kms_vrr@negative-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_vrr@negative-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#3555] / [i915#9906])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9906]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9906]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#9906])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#2437] / [i915#9412])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#2437] / [i915#9412]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#2437] / [i915#9412])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-8/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#2436])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#12506]) +8 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          [PASS][356] -> [SKIP][357] ([i915#12506]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@perf_pmu@enable-race.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][358] ([i915#11823])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#3708]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#9917])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][361] ([i915#12910]) +19 other tests fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@testdisplay:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][362] ([i915#4423]) +2 other tests dmesg-warn
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-14/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][363] ([i915#2582]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@fbdev@nullptr.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@fbdev@nullptr.html

  * igt@gem_exec_parallel@basic@bcs0:
    - shard-rkl:          [DMESG-WARN][365] -> [PASS][366] +51 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@gem_exec_parallel@basic@bcs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@gem_exec_parallel@basic@bcs0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [SKIP][367] ([i915#12936]) -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_lmem_swapping@verify-ccs.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][369] -> [PASS][370] +2 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@gem_workarounds@suspend-resume-context.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-10/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][371] ([i915#2346]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][373] ([i915#12917]) -> [PASS][374] +2 other tests pass
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-tglu:         [FAIL][375] ([i915#12431]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][377] -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@kms_flip@dpms-vs-vblank-race-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg1:          [FAIL][379] ([i915#12517] / [i915#12996] / [i915#2122]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][381] ([i915#2122]) -> [PASS][382] +9 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][383] -> [PASS][384] +13 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][385] -> [PASS][386] +22 other tests pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][387] -> [PASS][388] +2 other tests pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][389] -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [SKIP][391] -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_hdmi_inject@inject-audio.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg1:          [INCOMPLETE][393] ([i915#12756]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-17/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-13/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][395] ([i915#12964]) -> [PASS][396] +12 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][397] ([i915#2575] / [i915#9423]) -> [PASS][398] +2 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][399] ([i915#9519]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][401] ([i915#9519]) -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][403] ([i915#5465]) -> [PASS][404] +2 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-snb6/igt@kms_setmode@basic.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-snb1/igt@kms_setmode@basic.html

  * igt@kms_vblank@query-busy:
    - shard-dg1:          [DMESG-WARN][405] ([i915#4423]) -> [PASS][406] +3 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg1-13/igt@kms_vblank@query-busy.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg1-12/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][407] ([i915#2575]) -> [PASS][408] +95 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][409] ([i915#10538]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-tglu-6/igt@perf@blocking@0-rcs0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-tglu-4/igt@perf@blocking@0-rcs0.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][411] ([i915#12506]) -> [PASS][412] +5 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][413] ([i915#4349]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][415] ([i915#2575]) -> [SKIP][416] ([i915#8411])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          [SKIP][417] ([i915#8414]) -> [SKIP][418] ([i915#12506]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@drm_fdinfo@isolation.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@drm_fdinfo@isolation.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][419] ([i915#2575]) -> [SKIP][420] ([i915#3936])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_busy@semaphore.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@gem_busy@semaphore.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][421] ([i915#2575]) -> [INCOMPLETE][422] ([i915#7297])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][423] ([i915#8562]) -> [SKIP][424] ([i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_create@create-ext-set-pat.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#280])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [SKIP][428] ([i915#4771])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [SKIP][430] ([i915#4812])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-2/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          [SKIP][431] ([i915#8555]) -> [SKIP][432] ([i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][433] ([i915#2575]) -> [SKIP][434] ([i915#3539] / [i915#4852]) +2 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-dg2:          [SKIP][435] ([i915#3281]) -> [SKIP][436] ([i915#2575]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-read-noreloc.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-dg2:          [SKIP][437] ([i915#2575]) -> [SKIP][438] ([i915#3281]) +4 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][439] ([i915#4860]) -> [SKIP][440] ([i915#2575]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-dg2:          [SKIP][441] ([i915#2575]) -> [SKIP][442] ([i915#4077]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_gtt@basic-write-read-distinct.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-4/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          [SKIP][443] ([i915#4077]) -> [SKIP][444] ([i915#2575]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@gem_mmap_gtt@zero-extend.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [SKIP][446] ([i915#4083]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_mmap_wc@coherency.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-7/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          [SKIP][447] ([i915#4083]) -> [SKIP][448] ([i915#2575]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-1/igt@gem_mmap_wc@fault-concurrent.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          [SKIP][449] ([i915#3282]) -> [SKIP][450] ([i915#2575]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [TIMEOUT][451] -> [SKIP][452] ([i915#4270])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][453] ([i915#2575]) -> [SKIP][454] ([i915#4270]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15732/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/shard-dg2-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          [TIMEOU

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12178/index.html
