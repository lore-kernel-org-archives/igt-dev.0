Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF5D68BFF
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 19:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35D810E2B9;
	Sun, 24 Nov 2024 19:06:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F29410E2B9;
 Sun, 24 Nov 2024 19:06:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Fix_spin_engine_hang?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 19:06:35 -0000
Message-ID: <173247519560.2550060.12234823170173926182@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <7occzjselhix5vtg2qumxo52zxm6t2g23jnlg6wtwowp2osisn@ucaa2k2v7tpg>
In-Reply-To: <7occzjselhix5vtg2qumxo52zxm6t2g23jnlg6wtwowp2osisn@ucaa2k2v7tpg>
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

Series: tests/intel/i915_hangman: Fix spin engine hang
URL   : https://patchwork.freedesktop.org/series/141694/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8123_full -> IGTPW_12176_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12176_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12176_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12176_full:

### IGT changes ###

#### Possible regressions ####

  * igt@dmabuf@all-tests:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk5/igt@dmabuf@all-tests.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload:
    - shard-tglu-1:       NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [PASS][10] -> [SKIP][11] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@i915_pm_rpm@reg-read-ioctl.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][12] -> [DMESG-FAIL][13] +4 other tests dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-2/igt@i915_suspend@debugfs-reader.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][15] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][16] +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-fences@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][17] +8 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html

  * igt@kms_plane@pixel-format:
    - shard-tglu:         [PASS][18] -> [ABORT][19] +1 other test abort
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-5/igt@kms_plane@pixel-format.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_plane@pixel-format.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-rkl:          [PASS][20] -> [DMESG-WARN][21] +53 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-4/igt@perf_pmu@busy-double-start@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@perf_pmu@busy-double-start@vecs0.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          [SKIP][22] ([i915#2575]) -> [SKIP][23] +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_create@busy-create:
    - {shard-dg2-9}:      NOTRUN -> [INCOMPLETE][24] +1 other test incomplete
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-9/igt@gem_create@busy-create.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][25] +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  
Known issues
------------

  Here are the changes found in IGTPW_12176_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#8411])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6230])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8411])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#11078])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#11078])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [PASS][32] -> [ABORT][33] ([i915#5507])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
    - shard-glk:          NOTRUN -> [ABORT][34] ([i915#5507])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk8/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@basics:
    - shard-dg2:          [PASS][35] -> [SKIP][36] ([i915#12506]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-7/igt@drm_fdinfo@basics.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@drm_fdinfo@basics.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8414]) +16 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8414]) +14 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][39] -> [SKIP][40] ([i915#2582]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@fbdev@pan.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@fbdev@pan.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#7697]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#7697])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#9323])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#3555] / [i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][46] ([i915#12392] / [i915#7297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-dg2:          [PASS][47] -> [SKIP][48] ([i915#2575]) +164 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#8555]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][50] ([i915#11980] / [i915#12580])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][51] ([i915#11980] / [i915#12580])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#1099])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#280]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#280])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg2:          NOTRUN -> [FAIL][55] ([i915#5784])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][56] ([i915#5784])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4771])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4812]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#6334]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3539]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3539] / [i915#4852]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-rkl:          [PASS][63] -> [DMESG-WARN][64] ([i915#12964])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@gem_exec_nop@basic-sequential.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3281]) +18 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3281]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3281]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#7276])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4812]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4537] / [i915#4812]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4860]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4860]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#4613] / [i915#7582])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][74] ([i915#4613]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4613]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          [PASS][76] -> [SKIP][77] ([i915#12936]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_lmem_swapping@parallel-random.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#12193]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4613]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-5/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#12936]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4565]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#284])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077]) +13 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] +18 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4083]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@display:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@gem_pread@display.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][91] ([i915#2658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk9/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12917])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglu:         [PASS][93] -> [SKIP][94] ([i915#4270]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-5/igt@gem_pxp@display-protected-crc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4270])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#12975])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2575] / [i915#5190])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4079])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4885])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3297]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#3282] / [i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3282] / [i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#3297]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4958])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#2527]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#2527] / [i915#2856]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#2527]) +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2856]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@gen9_exec_parse@unaligned-access.html
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][115] ([i915#9820])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#8399])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][117] -> [FAIL][118] ([i915#12942]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][119] ([i915#2681]) +4 other tests warn
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
    - shard-dg1:          [PASS][120] -> [FAIL][121] ([i915#12548] / [i915#3591]) +2 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#11681] / [i915#6621])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#11681])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#6188])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#5723])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][126] ([i915#7443])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#7707])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4212]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#8709]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#6228])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][134] ([i915#12964]) +1 other test dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-dg1:          [PASS][135] -> [DMESG-WARN][136] ([i915#4423]) +3 other tests dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-14/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#5286]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5286]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#5286]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5286]) +10 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3638])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#5190]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3638]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][146] +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538]) +8 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][148] +236 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#6095]) +144 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12313]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#12313])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6095]) +178 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#6095]) +24 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#6095]) +68 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#10434] / [i915#6095])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6095]) +69 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#11616] / [i915#7213])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3742])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3742])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7213]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4087]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#7828]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#7828]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7828]) +11 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#7828])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7116] / [i915#9424]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][171] +55 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb1/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7118] / [i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7118] / [i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3299]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_content_protection@mei-interface.html
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6944] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9433])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#7116])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#6944] / [i915#7116] / [i915#7118])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3555]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#12976]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#12976]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3555]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#12976])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#12976]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - shard-glk:          [PASS][190] -> [FAIL][191] ([i915#2346])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-glk4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5354]) +20 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][193] -> [FAIL][194] ([i915#2346]) +1 other test fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#4103])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4103] / [i915#4213])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#9723])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#9723])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3804])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][200] -> [SKIP][201] ([i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#1257])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#1257])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#1257])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#12402])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#12402])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3840] / [i915#9053])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3840] / [i915#9053])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#3840] / [i915#9053])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3840] / [i915#9053])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#3955])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3469]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3469])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#3469])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2065] / [i915#4854])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-5/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#4854])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#4854])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#1839]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#1839])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#1839])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#9337])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#658])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-8/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#658])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#3637]) +10 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][231] -> [FAIL][232] ([i915#2122]) +2 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-glk4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#2122]) +4 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#3637])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#2575]) +66 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#9934]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#9934]) +11 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][239] -> [FAIL][240] ([i915#2122]) +3 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#8381])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8381])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][243] ([i915#4423]) +2 other tests dmesg-warn
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][244] ([i915#2122]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555] / [i915#5190])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672] / [i915#3555])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672] / [i915#3555])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [FAIL][254] ([i915#6880])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][255] -> [SKIP][256] +22 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#8708]) +13 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][258] -> [SKIP][259] +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#1825]) +15 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#8708]) +27 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][262] +33 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#3458]) +32 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][264] +68 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#5439])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#5439])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#9766])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#9766])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#3458]) +10 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][270] +96 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3023]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#3555] / [i915#8228])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_hdr@bpc-switch.html
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#10656])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#10656])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#12394]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12339])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#12388])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#6301])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#6301]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-tglu:         [PASS][283] -> [ABORT][284] ([i915#10159]) +1 other test abort
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#3555]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][286] ([i915#8292]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#12247]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#12247]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-dg2:          [PASS][289] -> [SKIP][290] ([i915#2575] / [i915#9423]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#12247] / [i915#6953]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2575] / [i915#9423]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12247] / [i915#3555])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#12247] / [i915#3555] / [i915#9423])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#12247] / [i915#3555])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#12247] / [i915#6953] / [i915#9423])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#12247]) +21 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#12247]) +16 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#12247]) +7 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#5354]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#12343])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#12343])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9812]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#5354])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#3828])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#8430])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [PASS][308] -> [SKIP][309] ([i915#12937])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-6/igt@kms_pm_rpm@cursor-dpms.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][310] -> [SKIP][311] ([i915#9519]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12937])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][313] -> [FAIL][314] ([i915#8717])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@kms_pm_rpm@i2c.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#9519]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#9519]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#6524])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][318] ([i915#11520])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#11520]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][320] ([i915#11520]) +9 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#11520]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#11520]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#11520]) +16 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#11520]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#9683])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#1072] / [i915#9732]) +8 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9732]) +22 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +33 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#4423] / [i915#9732])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9732]) +5 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#1072] / [i915#9732]) +16 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9685])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#9685])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#4884])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#5289])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#12755] / [i915#5190])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#5289])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12755]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#3555]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][340] ([IGT#2])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][341] ([IGT#2] / [i915#6493])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#8623])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#8623])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][344] ([i915#10959])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#9906])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#11920])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#3555] / [i915#9906])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9906]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9906]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#2437] / [i915#9412])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#2437] / [i915#9412])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#2437] / [i915#9412])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][353] ([i915#2437]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-glk8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#12506]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#7387])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][356] ([i915#4349]) +4 other tests fail
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][357] ([i915#11823])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#8516])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][359] ([i915#9351])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][360] ([i915#9351])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3708]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#9917])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][363] ([i915#12910]) +9 other tests fail
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-dg2:          [SKIP][364] ([i915#2582]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@fbdev@nullptr.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@fbdev@nullptr.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          [SKIP][366] ([i915#2575]) -> [PASS][367] +156 other tests pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [SKIP][368] ([i915#12936]) -> [PASS][369] +2 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][370] -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-8/igt@gem_workarounds@suspend-resume-context.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][372] ([i915#9820]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][374] ([i915#12964]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-1/igt@i915_pm_rpm@reg-read-ioctl.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-3/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][376] ([i915#5956]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-rkl:          [DMESG-WARN][378] -> [PASS][379] +63 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][380] ([i915#12917]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-rkl:          [FAIL][382] ([i915#10826]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][384] ([i915#2122]) -> [PASS][385] +2 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_flip@plain-flip-fb-recreate.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][386] ([i915#2122]) -> [PASS][387] +12 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][388] -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][390] -> [PASS][391] +26 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][392] -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [SKIP][396] -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][398] ([i915#12964]) -> [PASS][399] +9 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][400] ([i915#2575] / [i915#9423]) -> [PASS][401] +7 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][402] ([i915#12937]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][404] ([i915#9519]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][406] ([i915#9519]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_sysfs_edid_timing:
    - shard-snb:          [FAIL][408] ([IGT#2] / [i915#6493]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb1/igt@kms_sysfs_edid_timing.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-snb1/igt@kms_sysfs_edid_timing.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][410] ([i915#12506]) -> [PASS][411] +4 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          [SKIP][412] ([i915#8414]) -> [SKIP][413] ([i915#12506]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@drm_fdinfo@isolation.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          [SKIP][414] ([i915#12506]) -> [SKIP][415] ([i915#8414]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-1/igt@drm_fdinfo@virtual-busy.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#3936])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_busy@semaphore.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@gem_busy@semaphore.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [INCOMPLETE][419] ([i915#7297])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#7697])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#8562])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][424] ([i915#2575]) -> [SKIP][425] ([i915#8555])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][426] ([i915#4771]) -> [SKIP][427] ([i915#2575])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#4771])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-10/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][430] ([i915#4036]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          [SKIP][432] ([i915#4812]) -> [SKIP][433] ([i915#2575]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@gem_exec_balancer@sliced.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#3539] / [i915#4852]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][436] ([i915#3539] / [i915#4852]) -> [SKIP][437] ([i915#2575]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#3281]) +5 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][440] ([i915#3281]) -> [SKIP][441] ([i915#2575]) +8 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][442] ([i915#4537] / [i915#4812]) -> [SKIP][443] ([i915#2575])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          [SKIP][444] ([i915#2575]) -> [SKIP][445] ([i915#4860]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#4077]) +7 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_mmap_gtt@hang.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-7/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          [SKIP][448] ([i915#4083]) -> [SKIP][449] ([i915#2575]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-5/igt@gem_mmap_wc@coherency.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-11/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#4083]) +5 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12176/index.html
