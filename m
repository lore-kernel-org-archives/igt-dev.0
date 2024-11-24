Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1964CE66887
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 13:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ADA10E2A7;
	Sun, 24 Nov 2024 13:30:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D440E10E2A7;
 Sun, 24 Nov 2024 13:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?CI=2C1/2=5D_lib/igt=5Fkmod=3A_Drop_legacy_kunit_fallback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 13:30:16 -0000
Message-ID: <173245501688.2464419.907453439234464780@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121225510.3701650-1-lucas.demarchi@intel.com>
In-Reply-To: <20241121225510.3701650-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,1/2] lib/igt_kmod: Drop legacy kunit fallback
URL   : https://patchwork.freedesktop.org/series/141680/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15727_full -> IGTPW_12168_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12168_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12168_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12168_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-rkl:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@i915_pm_rpm@reg-read-ioctl.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          NOTRUN -> [FAIL][7] +37 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][10] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][11] +9 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][12] +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
    - shard-rkl:          [PASS][13] -> [DMESG-WARN][14] +73 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html

  * igt@kms_plane@pixel-format@pipe-a-plane-5:
    - shard-tglu:         [PASS][15] -> [ABORT][16] +3 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-4/igt@kms_plane@pixel-format@pipe-a-plane-5.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-9/igt@kms_plane@pixel-format@pipe-a-plane-5.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          [SKIP][17] ([i915#2575]) -> [SKIP][18] +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-rkl:          [DMESG-WARN][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-3/igt@kms_pm_rpm@drm-resources-equal.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_pm_rpm@drm-resources-equal.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - {shard-dg2-9}:      NOTRUN -> [ABORT][21] +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-9/igt@i915_pm_rpm@gem-execbuf-stress.html

  
Known issues
------------

  Here are the changes found in IGTPW_12168_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#6230])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8411])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#9318])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#11078])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         NOTRUN -> [ABORT][26] ([i915#12817] / [i915#5507])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8414]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8414]) +14 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@drm_fdinfo@busy@vcs1.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8555]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#1099]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#6334]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][40] ([i915#11965] / [i915#12558]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][41] ([i915#11965]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3281]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +13 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][47] ([i915#7975] / [i915#8213]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4860]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#4613]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#12193]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4565]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          [PASS][53] -> [SKIP][54] ([i915#12936]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@gem_lmem_swapping@parallel-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#4613]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4083]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4077]) +14 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4077]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_mmap_wc@bad-size.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3282]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][64] ([i915#2658])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][65] ([i915#2658])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][66] ([i915#12917]) +1 other test timeout
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#5190] / [i915#8428]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#2575] / [i915#5190]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4885])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglu:         [PASS][73] -> [ABORT][74] ([i915#12817])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@gem_softpin@noreloc-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4079])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3297]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#3297])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#2856]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#2527])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#2527]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#2527] / [i915#2856]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [PASS][86] -> [FAIL][87] ([i915#12870])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@i915_module_load@reload.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][88] ([i915#9820])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#8399]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#8399])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#6590]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][92] -> [FAIL][93] ([i915#12942]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#11681] / [i915#6621])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#11681] / [i915#6621])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#11681])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4387])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#4387])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#5723])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#5723])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#5723])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][102] ([i915#9311]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4212]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4212]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [PASS][105] -> [FAIL][106] ([i915#10991]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#5286]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#5286]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#5286]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5286]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#5286]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5190]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#3638]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#3638]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#5190]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#6095]) +179 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#12313]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#12313])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][121] +189 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#10307] / [i915#6095]) +155 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#12313])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#6095]) +76 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#12805])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#12805])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#6095]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#12313]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6095]) +74 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#6095]) +24 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3742])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#11616] / [i915#7213])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3742])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4087]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#7828]) +13 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7828]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#7828]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#7828]) +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#7828]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#7118] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3299]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3299])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#9424]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6944] / [i915#9424])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7118] / [i915#9424])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7116] / [i915#9424]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-rkl:          [PASS][149] -> [DMESG-WARN][150] ([i915#12917]) +2 other tests dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12976]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][152] ([i915#12964]) +1 other test dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#3555])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#12976]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3555])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][156] ([i915#12917])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#12976])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#4103] / [i915#4213])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-glk:          [PASS][159] -> [FAIL][160] ([i915#2346])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-glk9/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#4103])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][162] ([i915#2346])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#9833])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9723])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#8588])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#1257])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3840]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3840])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3840])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3840])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3555] / [i915#3840])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#3840] / [i915#9053])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3840] / [i915#9053])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#1839])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#1839])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#9934]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3637]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#8381]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3637]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9934]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-snb:          [PASS][181] -> [FAIL][182] ([i915#10826]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [PASS][183] -> [DMESG-WARN][184] ([i915#12964]) +15 other tests dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-vga1:
    - shard-snb:          [PASS][185] -> [FAIL][186] ([i915#2122]) +4 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-vga1.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb4/igt@kms_flip@plain-flip-ts-check@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#2672] / [i915#3555]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#2587] / [i915#2672]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#2672]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#2672] / [i915#3555] / [i915#5190])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#2672] / [i915#3555]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#2587] / [i915#2672]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#2587] / [i915#2672]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555]) +7 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#2672]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [PASS][198] -> [FAIL][199] ([i915#6880]) +2 other tests fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][200] +98 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#8708]) +26 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [PASS][202] -> [SKIP][203] +27 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3458]) +10 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#8708]) +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][206] +63 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1825]) +16 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#5354]) +23 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#5439])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#5439])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#5439])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#10055])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#9766])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#9766])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3023]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] +37 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#4423] / [i915#8708])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3458]) +26 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#12713])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8228]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#12339])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#12388])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#12388])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#12388])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#12388])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#12394])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#12394])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#12339])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#12339])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#12339])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][234] ([i915#12169])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][235] ([i915#10647]) +1 other test fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#12247]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#12247]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#12247]) +7 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#12247] / [i915#6953])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#12247]) +17 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#2575] / [i915#9423])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#2575] / [i915#9423]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#9812]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#5354])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#9812])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9685])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][249] +28 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#8430])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#8430])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#8430])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#8430])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#9519])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#9519])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][256] -> [SKIP][257] ([i915#9519]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#6524]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#6524]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#6524])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][261] ([i915#11520]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][262] ([i915#11520]) +6 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#11520]) +7 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#11520]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#11520]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#11520]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#11520]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#9732]) +23 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-4/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#1072] / [i915#9732]) +11 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#1072] / [i915#9732]) +31 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#1072] / [i915#9732]) +15 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#9732]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#9685])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9685])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#5289]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#5289])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12755] / [i915#5190])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#5289]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#3555]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#3555]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][281] ([i915#12231]) +1 other test abort
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk4/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][282] ([IGT#2])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][283] ([IGT#2] / [i915#6493])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#8623])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#8623])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#9906])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9906])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9906])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#2437])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#2437])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#2433])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling-parameterized:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#12506]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@perf@polling-parameterized.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@perf@polling-parameterized.html

  * igt@perf@polling@0-rcs0:
    - shard-tglu-1:       NOTRUN -> [FAIL][294] ([i915#10538]) +1 other test fail
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-1/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#8850])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12506]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@perf_pmu@enable-race.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#8516])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#8516])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-dg2:          [PASS][299] -> [FAIL][300] ([i915#4349]) +5 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-4/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@prime_busy@before:
    - shard-dg2:          [PASS][301] -> [SKIP][302] ([i915#2575]) +153 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@prime_busy@before.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@prime_busy@before.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#3708])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#3291] / [i915#3708])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#9917])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][306] ([i915#12910]) +8 other tests fail
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2575]) +56 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][308] +145 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb6/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][309] +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#4818])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#2575] / [i915#4818])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][312] ([i915#11703]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@core_hotunplug@unbind-rebind.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb2/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][314] -> [PASS][315] +38 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][316] ([i915#2582]) -> [PASS][317] +2 other tests pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@fbdev@unaligned-read.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@fbdev@unaligned-read.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][318] ([i915#11713]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-2/igt@gem_exec_big@single.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-rkl:          [DMESG-WARN][320] ([i915#12964]) -> [PASS][321] +11 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg2:          [SKIP][322] ([i915#12936]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         [SKIP][324] ([i915#4270]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][326] ([i915#9820]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live:
    - shard-rkl:          [ABORT][328] -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@i915_selftest@live.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@i915_selftest@live.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [INCOMPLETE][330] ([i915#4817]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          [INCOMPLETE][332] -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-18/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-dg2:          [SKIP][334] -> [PASS][335] +24 other tests pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][336] ([i915#2346]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][338] ([i915#12917]) -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][340] ([i915#11989]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [INCOMPLETE][342] ([i915#4423] / [i915#4839] / [i915#6113]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-glk:          [FAIL][344] -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a2:
    - shard-glk:          [FAIL][346] ([i915#2122]) -> [PASS][347] +3 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a2.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][348] ([i915#2122]) -> [PASS][349] +8 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][350] ([i915#2122]) -> [PASS][351] +7 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [FAIL][352] ([i915#11989] / [i915#2122]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg1:          [FAIL][354] ([i915#11989] / [i915#12517] / [i915#2122]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-12/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-18/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          [FAIL][356] ([i915#2122]) -> [PASS][357] +2 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          [FAIL][358] ([i915#6880]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-snb:          [SKIP][360] -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb-handle-closed:
    - shard-dg2:          [SKIP][362] ([i915#2575]) -> [PASS][363] +155 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_getfb@getfb-handle-closed.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@kms_getfb@getfb-handle-closed.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-tglu:         [ABORT][364] -> [PASS][365] +3 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-9/igt@kms_plane@pixel-format-source-clamping.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [SKIP][366] ([i915#2575] / [i915#9423]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][368] ([i915#9295]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [SKIP][370] ([i915#12937]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@kms_pm_rpm@cursor.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][372] -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][374] ([i915#9519]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][376] ([i915#5465]) -> [PASS][377] +2 other tests pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-snb2/igt@kms_setmode@basic.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-snb4/igt@kms_setmode@basic.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][378] ([i915#12506]) -> [PASS][379] +4 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [FAIL][380] ([i915#10538]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-1/igt@perf@polling@0-rcs0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-2/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [FAIL][382] ([i915#11943] / [i915#12515]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][384] ([i915#4349]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled:
    - shard-dg1:          [DMESG-WARN][386] ([i915#4423]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg1-17/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg1-13/igt@syncobj_timeline@multi-wait-for-submit-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][388] ([i915#8411]) -> [SKIP][389] ([i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-hang:
    - shard-dg2:          [SKIP][390] ([i915#12506]) -> [SKIP][391] ([i915#8414])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@drm_fdinfo@busy-hang.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@drm_fdinfo@busy-hang.html

  * igt@drm_fdinfo@most-busy-idle-check-all:
    - shard-dg2:          [SKIP][392] ([i915#8414]) -> [SKIP][393] ([i915#12506]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@drm_fdinfo@most-busy-idle-check-all.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@drm_fdinfo@most-busy-idle-check-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          [SKIP][394] ([i915#7697]) -> [SKIP][395] ([i915#2575])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-2/igt@gem_basic@multigpu-create-close.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][396] ([i915#2575]) -> [INCOMPLETE][397] ([i915#7297])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][398] ([i915#9561]) -> [SKIP][399] ([i915#2575])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#8555])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-close.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][402] ([i915#2575]) -> [SKIP][403] ([i915#280])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][404] ([i915#280]) -> [SKIP][405] ([i915#2575])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][406] ([i915#4771]) -> [SKIP][407] ([i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@gem_exec_balancer@bonded-sync.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_capture@capture:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [FAIL][409] ([i915#11965] / [i915#12558])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_capture@capture.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_exec_capture@capture.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#4812])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_fence@submit3.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([i915#3539] / [i915#4852])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#3539]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-2/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          [SKIP][416] ([i915#3539] / [i915#4852]) -> [SKIP][417] ([i915#2575])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_exec_flush@basic-wb-pro-default.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          [SKIP][418] ([i915#5107]) -> [SKIP][419] ([i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][420] ([i915#3281]) -> [SKIP][421] ([i915#2575]) +8 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#3281]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][424] ([i915#4537] / [i915#4812]) -> [SKIP][425] ([i915#2575]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#4860]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-dg2:          [SKIP][428] ([i915#3282]) -> [SKIP][429] ([i915#2575]) +5 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_madvise@dontneed-before-exec.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          [SKIP][430] ([i915#8289]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-7/igt@gem_media_fill@media-fill.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          [SKIP][432] ([i915#4077]) -> [SKIP][433] ([i915#2575]) +8 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-10/igt@gem_mmap_gtt@basic-small-bo.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#4077]) +10 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          [SKIP][436] ([i915#4083]) -> [SKIP][437] ([i915#2575]) +4 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-6/igt@gem_mmap_wc@write-cpu-read-wc.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#4083]) +6 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-7/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#3282]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-3/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][442] ([i915#4270]) -> [SKIP][443] ([i915#2575]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#4270]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_pxp@fail-invalid-protected-context.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-6/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][446] ([i915#4270]) -> [TIMEOUT][447] ([i915#12917])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][448] ([i915#2575] / [i915#5190]) -> [SKIP][449] ([i915#5190] / [i915#8428]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][450] ([i915#5190] / [i915#8428]) -> [SKIP][451] ([i915#2575] / [i915#5190]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15727/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          [SKIP][452] ([i915#2575]) -> [SKIP][453] ([i915#4885])
   [452]: htt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12168/index.html
