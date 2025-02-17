Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F63C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 12:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CC110E08E;
	Mon, 17 Feb 2025 12:47:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412A510E08E;
 Mon, 17 Feb 2025 12:47:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4103155130236828714=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_add_test_to_validate_uhb?=
 =?utf-8?q?r/non-uhbr_over_sst/mst_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Feb 2025 12:47:41 -0000
Message-ID: <173979646124.3257432.5666372664974021789@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217064239.2019316-1-kunal1.joshi@intel.com>
In-Reply-To: <20250217064239.2019316-1-kunal1.joshi@intel.com>
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

--===============4103155130236828714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate uhbr/non-uhbr over sst/mst (rev4)
URL   : https://patchwork.freedesktop.org/series/143039/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16143_full -> IGTPW_12610_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12610_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12610_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12610_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk6/igt@gem_softpin@noreloc-s3.html

  * {igt@kms_dp_link_training@non-uhbr-mst} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-dg2:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * {igt@kms_dp_link_training@non-uhbr-sst} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg1:          [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-19/igt@kms_flip@absolute-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_flip@absolute-wf_vblank.html

  * igt@perf_pmu@module-unload:
    - shard-mtlp:         [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-6/igt@perf_pmu@module-unload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@perf_pmu@module-unload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16143_full and IGTPW_12610_full:

### New IGT tests (5) ###

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.10] s

  * igt@kms_dp_link_training@non-uhbr-mst:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_link_training@non-uhbr-sst:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.20] s

  * igt@kms_dp_link_training@uhbr-mst:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_dp_link_training@uhbr-sst:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12610_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#9318])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][21] ([i915#8414])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8414])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][29] -> [INCOMPLETE][30] ([i915#13356])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][31] -> [INCOMPLETE][32] ([i915#12392] / [i915#13356])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#6335])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6335])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][36] -> [DMESG-FAIL][37] ([i915#12964]) +1 other test dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][38] ([i915#1099]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb5/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#5882]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html

  * igt@gem_eio@hibernate:
    - shard-glk:          NOTRUN -> [ABORT][40] ([i915#13661])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][41] ([i915#13197] / [i915#13390])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk6/igt@gem_eio@in-flight-suspend.html
    - shard-mtlp:         [PASS][42] -> [ABORT][43] ([i915#13193])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-3/igt@gem_eio@in-flight-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][44] -> [DMESG-WARN][45] ([i915#13363])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-3/igt@gem_eio@kms.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4036])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#8555])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4525])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4525]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][50] ([i915#4525])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#6334]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#6334]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2-9:        NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#5107])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3281]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3281]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#3281]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3281]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4537])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4537] / [i915#4812]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4537] / [i915#4812]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4860]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#2190])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#4613] / [i915#7582])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#12193])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0 (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4565])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4613]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#4613]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][76] ([i915#5493]) +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][77] ([i915#5493]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#4613])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#284])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#284])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4083]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg2-9:        NOTRUN -> [SKIP][82] ([i915#4077])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4077]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@close:
    - shard-dg2-9:        NOTRUN -> [SKIP][84] ([i915#4083])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@read-write:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3282]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@snoop:
    - shard-dg2-9:        NOTRUN -> [SKIP][89] ([i915#3282])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_pread@snoop.html

  * igt@gem_pread@uncached:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_pread@uncached.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4270])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2-9:        NOTRUN -> [SKIP][92] ([i915#4270])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#13398]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#13398]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917] / [i915#12964])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [PASS][96] -> [TIMEOUT][97] ([i915#12917] / [i915#12964]) +1 other test timeout
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4270]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#3282]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#5190] / [i915#8428]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#8428]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4079]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-dg2-9:        NOTRUN -> [SKIP][105] ([i915#4079])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4077]) +13 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#4077]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297] / [i915#3323])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2-9:        NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2-9:        NOTRUN -> [SKIP][110] ([i915#3282] / [i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@gem_userptr_blits@readonly-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3297])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gem_userptr_blits@readonly-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3297])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#3281] / [i915#3297])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_userptr_blits@relocations.html
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3281] / [i915#3297])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3281] / [i915#3297])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          NOTRUN -> [ABORT][118] ([i915#5566])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#2527])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2-9:        NOTRUN -> [SKIP][120] ([i915#2856])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#2856]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#2527])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#2527] / [i915#2856]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#2856]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#2527] / [i915#2856]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][126] -> [ABORT][127] ([i915#9820])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#6412])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#8399]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][130] ([i915#12797]) +1 other test incomplete
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#11681] / [i915#6621])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#11681] / [i915#6621])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#11681])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4387])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#4387])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4387])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#4387])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#8437])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][139] ([i915#1982] / [i915#9311])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][140] ([i915#9311]) +1 other test dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][141] ([i915#9311]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][142] ([i915#9311]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@i915_selftest@mock@memory_region.html
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][143] ([i915#9311]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@i915_selftest@mock@memory_region.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][144] ([i915#9311]) +1 other test dmesg-warn
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][145] ([i915#9311])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][146] ([i915#12964])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#7707])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@intel_hwmon@hwmon-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#7707])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#7707]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4212]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][151] ([i915#8709]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#12967])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#12967])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#10333])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][155] ([i915#1769])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#1769] / [i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][157] -> [FAIL][158] ([i915#11808]) +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#5286])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#5286]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#4538] / [i915#5286]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5286]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4423] / [i915#4538] / [i915#5286])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][164] +12 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][165] +16 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#3638]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3638])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-9:        NOTRUN -> [SKIP][168] ([i915#5190]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5190]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg1:          [PASS][170] -> [DMESG-WARN][171] ([i915#4423]) +2 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4538] / [i915#5190]) +12 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#4538]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#6095]) +130 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][175] ([i915#10307] / [i915#6095]) +14 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6095]) +54 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#6095]) +75 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#6095]) +24 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][179] ([i915#12805])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][180] ([i915#12796]) +1 other test incomplete
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][181] ([i915#6095]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#6095]) +21 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#12313])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#12313])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#6095]) +19 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#10307] / [i915#6095]) +166 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][187] ([i915#12313])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#12313]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#10307] / [i915#10434] / [i915#6095]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#7213] / [i915#9010]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_cdclk@mode-transition.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#11616] / [i915#7213])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3742])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3742])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3742])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#7213]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#4087]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2-9:        NOTRUN -> [SKIP][197] ([i915#11151] / [i915#7828]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#11151] / [i915#7828]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#11151] / [i915#7828]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#11151] / [i915#7828]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#11151] / [i915#7828]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#11151] / [i915#7828]) +7 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_content_protection@atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#7118] / [i915#9424])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-9:        NOTRUN -> [SKIP][207] ([i915#7118] / [i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#6944] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][209] ([i915#3299])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3299])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3299]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3116])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#3116] / [i915#3299])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3299])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#9424])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#6944] / [i915#9424])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][217] ([i915#1339] / [i915#7173])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#13049])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#13049])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][220] -> [FAIL][221] ([i915#13566]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][222] -> [FAIL][223] ([i915#13566]) +3 other tests fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#13049])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#13049])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][226] ([i915#13566]) +3 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#8814])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][228] ([i915#3555]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#12358] / [i915#7882])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#12358])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [PASS][231] -> [DMESG-WARN][232] ([i915#12964]) +28 other tests dmesg-warn
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-8/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#4213])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#4103]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][235] +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][236] ([i915#13046] / [i915#5354])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#13046] / [i915#5354]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#9809])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#4103] / [i915#4213])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9833])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#9723])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#9833])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8588])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#8588])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#8588])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#8588])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#8588])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-9:        NOTRUN -> [SKIP][248] ([i915#1257])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_dp_aux_dev.html

  * {igt@kms_dp_link_training@uhbr-sst} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#3828])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#3828])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_dp_link_training@uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3828])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#8812]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#3555] / [i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3840])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#3840])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#3840] / [i915#9053])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#3469])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3469])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#4854])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-9:        NOTRUN -> [SKIP][260] ([i915#1839])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#1839])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#658])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#4881])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][264] -> [FAIL][265] ([i915#11989]) +5 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#3637]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][267] ([i915#9934]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9934]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#3637]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9934]) +8 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9934]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#3637]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][273] ([i915#12964]) +7 other tests dmesg-warn
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1:
    - shard-glk:          NOTRUN -> [DMESG-WARN][274] ([i915#118]) +2 other tests dmesg-warn
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu:         [PASS][275] -> [FAIL][276] ([i915#11989]) +1 other test fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#8381])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#8381]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-dg2:          [PASS][279] -> [FAIL][280] ([i915#11989]) +3 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][281] ([i915#2672] / [i915#3555])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#2672]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#2672] / [i915#3555]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#2672]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#2672]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#2587] / [i915#2672]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#2672] / [i915#3555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#2587] / [i915#2672])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#2672] / [i915#8813]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][295] -> [FAIL][296] ([i915#6880]) +2 other tests fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5354]) +35 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][298] ([i915#8708]) +9 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][299] +21 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][300] ([i915#5354]) +7 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8708]) +9 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#8708]) +11 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#3458]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#3458]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][305] +164 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#10433] / [i915#3458]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#1825]) +21 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#8708]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][309] ([i915#3458]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9766])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][311] +69 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#1825]) +14 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] +21 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#3023]) +8 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8228])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12713])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#12713])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8228])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#3555] / [i915#8228]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8228])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8228]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#3555] / [i915#8228]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8228]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#10656])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#10656])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-9:        NOTRUN -> [SKIP][326] ([i915#10656])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][327] ([i915#12388])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#12339])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12388])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#13522])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#6301])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [PASS][332] -> [INCOMPLETE][333] ([i915#13026])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#3555])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_plane_multiple@tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#3555]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#13046] / [i915#5354] / [i915#9423])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#6953] / [i915#9423])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-9:        NOTRUN -> [SKIP][338] ([i915#12247]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#12247] / [i915#9423])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-9:        NOTRUN -> [SKIP][340] ([i915#12247] / [i915#9423]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#12247] / [i915#6953] / [i915#9423])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#12247] / [i915#6953])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#12247]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#12247]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#12247] / [i915#6953])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#12247]) +12 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#5354])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9812])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#12343])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-9:        NOTRUN -> [SKIP][350] ([i915#12343])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         [PASS][351] -> [FAIL][352] ([i915#12913])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#9340])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-9:        NOTRUN -> [SKIP][354] ([i915#9519])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#9519]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-dg2:          [PASS][356] -> [SKIP][357] ([i915#9519])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#9519])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][359] -> [SKIP][360] ([i915#9519]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#9519])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2-9:        NOTRUN -> [SKIP][362] +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#11520]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][364] ([i915#11520]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#11520]) +5 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#11520]) +9 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#9808])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][368] ([i915#11520]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#12316]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#11520]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][371] ([i915#11520]) +18 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#11520]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#9683])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-9:        NOTRUN -> [SKIP][374] ([i915#9683])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#1072] / [i915#9732]) +7 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#1072] / [i915#9732]) +8 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#1072] / [i915#9732]) +6 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#9688]) +9 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#9732]) +17 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr2-basic:
    - shard-mtlp:         NOTRUN -> [FAIL][380] ([i915#13509]) +1 other test fail
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#1072] / [i915#9732]) +18 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#9732]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][383] +583 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#9685])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#9685])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#12755]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#5190]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#5289])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#12755])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#5289])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][391] ([i915#12755])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#3555]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][393] ([i915#13179]) +1 other test abort
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][394] ([i915#13179]) +1 other test abort
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][395] ([i915#13179]) +1 other test abort
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][396] ([i915#5465]) +2 other tests fail
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb2/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#3555] / [i915#8809] / [i915#8823])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#8623])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#8623])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#9906])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#11920])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#11920])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#11920])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#11920])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#11920])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-9:        NOTRUN -> [SKIP][406] ([i915#3555] / [i915#9906])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#9906])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#2437] / [i915#9412])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][409] ([i915#2437])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][410] ([i915#2437] / [i915#9412])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][411] ([i915#2437]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#2437] / [i915#9412])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-mtlp:         [PASS][413] -> [FAIL][414] ([i915#10538])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#7387])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][416] ([i915#9100]) +1 other test fail
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@perf@non-zero-reason.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2-9:        NOTRUN -> [FAIL][417] ([i915#12549] / [i915#6806]) +1 other test fail
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@invalid-init:
    - shard-tglu-1:       NOTRUN -> [FAIL][418] ([i915#13663])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@perf_pmu@invalid-init.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][419] -> [FAIL][420] ([i915#4349]) +1 other test fail
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2-9:        NOTRUN -> [SKIP][421] ([i915#3708] / [i915#4077])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][422] ([i915#3708]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@prime_vgem@fence-read-hang.html
    - shard-dg2-9:        NOTRUN -> [SKIP][423] ([i915#3708])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#3708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@prime_vgem@fence-read-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#4818])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][426] ([i915#13427]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-mtlp:         [ABORT][428] ([i915#13193]) -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][430] ([i915#5784]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@gem_eio@kms.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][432] ([i915#11441] / [i915#13304]) -> [PASS][433] +1 other test pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][434] ([i915#9820]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [ABORT][436] ([i915#9820]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][438] ([i915#12455]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][440] ([i915#7984]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-4/igt@i915_power@sanity.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@i915_power@sanity.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [INCOMPLETE][442] ([i915#4817]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [FAIL][444] ([i915#5956]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [DMESG-WARN][446] ([i915#12964]) -> [PASS][447] +24 other tests pass
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-rkl:          [FAIL][448] ([i915#13566]) -> [PASS][449] +1 other test pass
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][450] ([i915#11989]) -> [PASS][451] +4 other tests pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][452] ([i915#6880]) -> [PASS][453] +2 other tests pass
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][454] -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][456] ([i915#3555] / [i915#8228]) -> [PASS][457]
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][458] ([i915#4281]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][460] ([i915#9519]) -> [PASS][461]
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-dg1:          [DMESG-WARN][462] ([i915#4423]) -> [PASS][463]
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_rotation_crc@cursor-rotation-180.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_rotation_crc@cursor-rotation-180.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][464] ([i915#5465]) -> [PASS][465] +2 other tests pass
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-8/igt@kms_setmode@basic.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_setmode@basic.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [FAIL][466] ([i915#10393]) -> [PASS][467] +1 other test pass
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-5/igt@kms_vrr@negative-basic.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_vrr@negative-basic.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-tglu:         [FAIL][468] ([i915#10538]) -> [PASS][469]
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg1:          [FAIL][470] ([i915#11943]) -> [PASS][471]
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [FAIL][472] ([i915#4349]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs0.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [FAIL][474] ([i915#4349]) -> [PASS][475]
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [INCOMPLETE][476] -> [PASS][477]
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-17/igt@perf_pmu@module-unload.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [TIMEOUT][478] ([i915#12917] / [i915#12964]) -> [SKIP][479] ([i915#4270]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][480] ([i915#4270]) -> [TIMEOUT][481] ([i915#12917] / [i915#12964])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][482] ([i915#6095]) -> [SKIP][483] ([i915#4423] / [i915#6095]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg1:          [SKIP][484] ([i915#11151] / [i915#7828]) -> [SKIP][485] ([i915#11151] / [i915#4423] / [i915#7828])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][486] ([i915#9424]) -> [SKIP][487] ([i915#9433])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_content_protection@mei-interface.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [SKIP][488] ([i915#7118] / [i915#9424]) -> [FAIL][489] ([i915#1339] / [i915#7173])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-3/igt@kms_content_protection@uevent.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][490] ([i915#3458]) -> [SKIP][491] ([i915#10433] / [i915#3458]) +2 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][492] -> [SKIP][493] ([i915#4423])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][494] ([i915#10433] / [i915#3458]) -> [SKIP][495] ([i915#3458])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          [SKIP][496] ([i915#3458]) -> [SKIP][497] ([i915#3458] / [i915#4423])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg1:          [SKIP][498] ([i915#8708]) -> [SKIP][499] ([i915#4423] / [i915#8708])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][500] ([i915#1187] / [i915#12713]) -> [SKIP][501] ([i915#12713])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          [SKIP][502] ([i915#11520] / [i915#4423]) -> [SKIP][503] ([i915#11520])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-sprite-mmap-gtt:
    - shard-dg1:          [SKIP][504] ([i915#1072] / [i915#9732]) -> [SKIP][505] ([i915#1072] / [i915#4423] / [i915#9732])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_psr@psr-sprite-mmap-gtt.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_psr@psr-sprite-mmap-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12913]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12913
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193
  [i915#13197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13197
  [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13509
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13661]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13661
  [i915#13663]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#9010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8232 -> IGTPW_12610
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_16143: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12610: 7b1e4a024a748973cbc330f1d86abbd899fcb60e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8232: 8232
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/index.html

--===============4103155130236828714==
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
<tr><td><b>Series:</b></td><td>add test to validate uhbr/non-uhbr over sst/mst (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143039/">https://patchwork.freedesktop.org/series/143039/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16143_full -&gt; IGTPW_12610_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12610_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12610_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12610_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-19/igt@kms_flip@absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_flip@absolute-wf_vblank.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-6/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@perf_pmu@module-unload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16143_full and IGTPW_12610_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12610_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb5/igt@gem_ctx_persistence@process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13661">i915#13661</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13197">i915#13197</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193">i915#13193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-3/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@gem_exec_fence@submit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0 (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_pread@uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gem_tiling_max_stride.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797">i915#12797</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@i915_suspend@forcewake.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967">i915#12967</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967">i915#12967</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333">i915#10333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +130 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010">i915#9010</a>) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616">i915#11616</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339">i915#1339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-8/igt@kms_cursor_edge_walk@64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +28 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-18/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_flip@blocking-absolute-wf_vblank@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +164 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12913">i915#12913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_psr@psr2-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13509">i915#13509</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> +583 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-8/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@perf@non-zero-reason.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549">i915#12549</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-init:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-1/igt@perf_pmu@invalid-init.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663">i915#13663</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-9/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-8/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427">i915#13427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193">i915#13193</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-8/igt@gem_eio@in-flight-internal-10ms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-8/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441">i915#11441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304">i915#13304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455">i915#12455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-4/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-4/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-glk8/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-9/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_rotation_crc@cursor-rotation-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_rotation_crc@cursor-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-4/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-5/igt@kms_vrr@negative-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393">i915#10393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-6/igt@kms_vrr@negative-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-tglu-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-tglu-6/igt@perf@gen12-group-concurrent-oa-buffer-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-17/igt@perf_pmu@module-unload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-14/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-11/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339">i915#1339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16143/shard-dg1-13/igt@kms_psr@psr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12610/shard-dg1-15/igt@kms_psr@psr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8232 -&gt; IGTPW_12610</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16143: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12610: 7b1e4a024a748973cbc330f1d86abbd899fcb60e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8232: 8232<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4103155130236828714==--
