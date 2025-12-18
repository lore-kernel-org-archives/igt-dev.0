Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D866ED6E2BD
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 17:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963210E1BC;
	Thu, 18 Dec 2025 17:31:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E0B10E1BC;
 Thu, 18 Dec 2025 17:31:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6985953394583377028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fpat=3A_?=
 =?utf-8?q?add_helper_funtion_to_read_PAT_table?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Dec 2025 17:31:54 -0000
Message-ID: <176607911485.102733.5795255399964793688@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218080620.286687-1-x.wang@intel.com>
In-Reply-To: <20251218080620.286687-1-x.wang@intel.com>
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

--===============6985953394583377028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: add helper funtion to read PAT table
URL   : https://patchwork.freedesktop.org/series/159189/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8672_full -> IGTPW_14233_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14233_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14233_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14233_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_plane_cursor@viewport.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:
    - shard-rkl:          NOTRUN -> [FAIL][4] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128.html

  
Known issues
------------

  Here are the changes found in IGTPW_14233_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#3281]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-snb:          NOTRUN -> [SKIP][7] +104 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][14] ([i915#13356]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][16] ([i915#1099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#4771])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#4771])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#4525])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][22] ([i915#11713])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#4812])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][24] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#14544] / [i915#3281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#3281]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3281]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4812])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][29] -> [INCOMPLETE][30] ([i915#13356]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4860]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4860])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#2190])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#4613] / [i915#7582])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#4613]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4613]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#284])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4083]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4083]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4083]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3282]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3282])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4270]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#8428]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#5190] / [i915#8428])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4885])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4079])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4077]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#3297]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3297])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3297])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#3297])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#2856])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#2527] / [i915#2856]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#2527]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#2527]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gen9_exec_parse@valid-registers.html
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#2527] / [i915#2856]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#14073]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@i915_drm_fdinfo@busy-idle@rcs0.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#6412])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#8399])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#6590]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][67] -> [FAIL][68] ([i915#12964]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][69] ([i915#13790] / [i915#2681]) +1 other test warn
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [PASS][70] -> [INCOMPLETE][71] ([i915#13356])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][72] ([i915#13356] / [i915#15172])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#11681] / [i915#6621])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#11681])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#14544] / [i915#6245])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#6188])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          NOTRUN -> [INCOMPLETE][77] ([i915#4817])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][78] -> [INCOMPLETE][79] ([i915#4817])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#7707])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4212])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4212])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#9531])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#1769] / [i915#3555])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk10:        NOTRUN -> [SKIP][85] ([i915#1769])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#1769] / [i915#3555])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#5286]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4538] / [i915#5286]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#5286])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#5286]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][91] -> [FAIL][92] ([i915#5138])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3638])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3638]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4538] / [i915#5190]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][96] +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4538]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6095]) +14 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#6095]) +166 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#10307] / [i915#6095]) +103 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#6095]) +34 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#6095]) +49 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#14544] / [i915#6095]) +10 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][106] +174 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#14098] / [i915#6095]) +36 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#12805])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#6095]) +43 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#12313])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#12313])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#6095]) +58 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3742])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3742])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#11151] / [i915#7828]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][116] +14 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#11151] / [i915#7828]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#11151] / [i915#7828]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#11151] / [i915#14544] / [i915#7828])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#11151] / [i915#7828]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#11151] / [i915#7828]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#6944] / [i915#9424])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#3116] / [i915#3299])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3299]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6944] / [i915#9424])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#6944])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][128] ([i915#7173]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@suspend-resume@pipe-a-dp-3.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#6944] / [i915#7116] / [i915#9424])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#3555]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3555]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#13049])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#3555] / [i915#8814]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3555]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][135] ([i915#13566]) +3 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][136] -> [FAIL][137] ([i915#13566]) +7 other tests fail
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][138] -> [FAIL][139] ([i915#13566]) +5 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#13049]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#13049]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#13049])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#14544]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#4103])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#9809]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][146] ([i915#2346])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#9067])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#9723])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#9723])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#14544] / [i915#3555] / [i915#3804])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#14544] / [i915#3804])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#1257])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#13749])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#13749])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#13707])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#13707])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3555] / [i915#3840])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3469])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3955])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#1839])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#1839])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#9337])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3637] / [i915#9934]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#9934]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3637] / [i915#9934]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#9934]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][167] -> [FAIL][168] ([i915#13027]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#9934]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3637] / [i915#9934]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#9934]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#14544] / [i915#9934])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-snb:          [PASS][173] -> [FAIL][174] ([i915#10826]) +1 other test fail
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a2:
    - shard-rkl:          [PASS][175] -> [INCOMPLETE][176] ([i915#6113])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#2672] / [i915#8813]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#2672] / [i915#3555] / [i915#5190])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#2672] / [i915#3555] / [i915#8813]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#2672])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#2587] / [i915#2672] / [i915#3555])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#2672] / [i915#3555])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#2587] / [i915#2672]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#2672] / [i915#3555]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#2672]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#15104])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][192] +39 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] +34 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8708]) +11 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][195] ([i915#10056])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#5439])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#15102])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#14544] / [i915#15102] / [i915#3023])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][199] +97 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#8708]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][201] +31 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#15102] / [i915#3458] / [i915#4423])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#15102] / [i915#3458]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#15102] / [i915#3023]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#15102]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#15104]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#15102]) +11 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#1825]) +15 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#14544] / [i915#1825]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#1825]) +16 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#15102] / [i915#3458]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8708]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#15102]) +17 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [PASS][214] -> [SKIP][215] ([i915#3555] / [i915#8228]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#13688])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#15458])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#15460])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#15459])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#15458])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#13522])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#4816])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][225] ([i915#13026]) +1 other test incomplete
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][226] ([i915#10647] / [i915#12169])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][227] ([i915#10647]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#13958])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#13958])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#15329] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#15329] / [i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#15329] / [i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#15329]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#15329]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#15329]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#15329] / [i915#3555] / [i915#6953])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#15329]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#5354])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#5354])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#9292])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#3828])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#14544] / [i915#9340])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#4077]) +4 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#15073]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#15073])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#15073])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#15073])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][248] -> [SKIP][249] ([i915#15073]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#6524])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#11520]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#11520]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#12316]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#11520]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][255] ([i915#11520]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#11520]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#11520]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][258] ([i915#11520]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][259] ([i915#11520]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#11520] / [i915#14544]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#4348])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#9732]) +16 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#1072] / [i915#9732]) +9 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9688]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@pr-basic:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9732]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_psr@pr-basic.html
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#1072] / [i915#9732]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#9685]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#4884])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#4235])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#4235])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#5289])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#5289])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#12755]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#3555]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][277] ([i915#13179]) +1 other test abort
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk9/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#8623])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][279] -> [INCOMPLETE][280] ([i915#12276])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-glk9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#11920])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][282] -> [FAIL][283] ([i915#15420]) +1 other test fail
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-mtlp-6/igt@kms_vrr@negative-basic.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#9906])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#7387])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#2434])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#2433])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#2433])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][289] -> [FAIL][290] ([i915#4349])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#8516])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#3708]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#3708])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#9917])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-rkl:          [INCOMPLETE][295] ([i915#13356]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][297] ([i915#14809]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@i915_module_load@load:
    - shard-snb:          ([PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [SKIP][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [SKIP][320], [PASS][321]) -> ([PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb4/igt@i915_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb4/igt@i915_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb4/igt@i915_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb4/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html
    - shard-glk10:        ([PASS][347], [SKIP][348]) -> ([PASS][349], [PASS][350])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-glk10/igt@i915_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-glk10/igt@i915_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@i915_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-glk10/igt@i915_module_load@load.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg1:          [DMESG-WARN][351] ([i915#4391] / [i915#4423]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg1-13/igt@i915_suspend@basic-s2idle-without-i915.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [INCOMPLETE][353] ([i915#4817]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@i915_suspend@forcewake.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][355] ([i915#5138]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][357] ([i915#12796]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][359] ([i915#14033]) -> [PASS][360] +1 other test pass
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg1:          [DMESG-WARN][361] ([i915#4423]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][363] ([i915#9340]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][365] ([i915#15073]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][367] ([i915#15106]) -> [PASS][368] +2 other tests pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-tglu-10/igt@kms_setmode@basic.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [ABORT][369] ([i915#15132]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][371] ([i915#3281]) -> [SKIP][372] ([i915#14544] / [i915#3281]) +4 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][373] ([i915#9323]) -> [SKIP][374] ([i915#14544] / [i915#9323])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][375] ([i915#13008]) -> [SKIP][376] ([i915#13008] / [i915#14544])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][377] ([i915#14544] / [i915#6335]) -> [SKIP][378] ([i915#6335])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][379] ([i915#280]) -> [SKIP][380] ([i915#14544] / [i915#280])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][381] ([i915#4525]) -> [SKIP][382] ([i915#14544] / [i915#4525])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][383] ([i915#14544] / [i915#6344]) -> [SKIP][384] ([i915#6344])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          [SKIP][385] ([i915#14544] / [i915#3281]) -> [SKIP][386] ([i915#3281]) +4 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][387] ([i915#4613]) -> [SKIP][388] ([i915#14544] / [i915#4613])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][389] ([i915#14544] / [i915#4613]) -> [SKIP][390] ([i915#4613]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_lmem_swapping@verify.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@gem_lmem_swapping@verify.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][391] ([i915#3282]) -> [SKIP][392] ([i915#14544] / [i915#3282]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          [SKIP][393] ([i915#14544] / [i915#8411]) -> [SKIP][394] ([i915#8411])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][395] ([i915#3281] / [i915#3297]) -> [SKIP][396] ([i915#14544] / [i915#3281] / [i915#3297])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@gem_userptr_blits@relocations.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][397] ([i915#2527]) -> [SKIP][398] ([i915#14544] / [i915#2527]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][399] ([i915#14544] / [i915#2527]) -> [SKIP][400] ([i915#2527]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#8399]) -> [SKIP][402] ([i915#8399])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][403] ([i915#8399]) -> [SKIP][404] ([i915#14544] / [i915#8399])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][405] ([i915#5723]) -> [SKIP][406] ([i915#14544] / [i915#5723])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][407] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][408] ([i915#1769] / [i915#3555])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][409] ([i915#14544] / [i915#5286]) -> [SKIP][410] ([i915#5286]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][411] ([i915#5286]) -> [SKIP][412] ([i915#14544] / [i915#5286]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][413] ([i915#3638]) -> [SKIP][414] ([i915#14544] / [i915#3638]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][415] ([i915#14544] / [i915#3638]) -> [SKIP][416] ([i915#3638])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][417] ([i915#14544]) -> [SKIP][418] +11 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][419] ([i915#14098] / [i915#6095]) -> [SKIP][420] ([i915#14098] / [i915#14544] / [i915#6095]) +10 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][421] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][422] ([i915#14098] / [i915#6095]) +11 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][423] ([i915#14544] / [i915#6095]) -> [SKIP][424] ([i915#6095]) +8 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][425] ([i915#6095]) -> [SKIP][426] ([i915#14544] / [i915#6095]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          [SKIP][427] ([i915#11151] / [i915#7828]) -> [SKIP][428] ([i915#11151] / [i915#14544] / [i915#7828]) +4 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][429] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][430] ([i915#11151] / [i915#7828]) +4 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [SKIP][431] ([i915#6944] / [i915#7118] / [i915#9424]) -> [FAIL][432] ([i915#7173])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-7/igt@kms_content_protection@atomic.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-rkl:          [SKIP][433] ([i915#15330]) -> [SKIP][434] ([i915#14544] / [i915#15330])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-8/igt@kms_content_protection@dp-mst-suspend-resume.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          [SKIP][435] ([i915#6944]) -> [FAIL][436] ([i915#7173])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-1/igt@kms_content_protection@suspend-resume.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][437] ([i915#6944] / [i915#7118] / [i915#7162] / [i915#9424]) -> [SKIP][438] ([i915#6944] / [i915#7118] / [i915#9424])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-11/igt@kms_content_protection@type1.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][440] ([i915#6944] / [i915#7118] / [i915#9424])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_content_protection@uevent.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][441] ([i915#13049]) -> [SKIP][442] ([i915#13049] / [i915#14544])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][443] ([i915#3555]) -> [SKIP][444] ([i915#14544] / [i915#3555]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#3555]) -> [SKIP][446] ([i915#3555])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][447] ([i915#14544] / [i915#4103]) -> [SKIP][448] ([i915#4103])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][450] ([i915#3555] / [i915#3840]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][451] ([i915#4854]) -> [SKIP][452] ([i915#14544] / [i915#4854])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#1839]) -> [SKIP][454] ([i915#1839]) +1 other test skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          [SKIP][455] ([i915#9934]) -> [SKIP][456] ([i915#14544] / [i915#9934]) +3 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#9934]) -> [SKIP][458] ([i915#9934]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [ABORT][459] ([i915#15132]) -> [INCOMPLETE][460] ([i915#6113])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][461] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][462] ([i915#2672] / [i915#3555])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#2672]) -> [SKIP][464] ([i915#2672])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][465] ([i915#2672] / [i915#3555]) -> [SKIP][466] ([i915#14544] / [i915#2672] / [i915#3555]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][467] ([i915#2672]) -> [SKIP][468] ([i915#14544] / [i915#2672]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][469] ([i915#15102]) -> [SKIP][470] ([i915#14544] / [i915#15102]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#15102]) -> [SKIP][472] ([i915#15102]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [SKIP][473] ([i915#15102] / [i915#3458]) -> [SKIP][474] ([i915#10433] / [i915#15102] / [i915#3458]) +4 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][475] -> [SKIP][476] ([i915#14544]) +16 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][477] ([i915#1825]) -> [SKIP][478] ([i915#14544] / [i915#1825]) +13 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#1825]) -> [SKIP][480] ([i915#1825]) +23 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][482] ([i915#15102] / [i915#3023]) +9 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][483] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][484] ([i915#15102] / [i915#3458]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][485] ([i915#15102] / [i915#3023]) -> [SKIP][486] ([i915#14544] / [i915#15102] / [i915#3023]) +8 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][487] ([i915#15460]) -> [SKIP][488] ([i915#14544] / [i915#15460])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#15458]) -> [SKIP][490] ([i915#15458])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][491] ([i915#6301]) -> [SKIP][492] ([i915#14544] / [i915#6301])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#15329]) -> [SKIP][494] ([i915#15329]) +3 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][495] ([i915#15329]) -> [SKIP][496] ([i915#14544] / [i915#15329]) +7 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][497] ([i915#9685]) -> [SKIP][498] ([i915#14544] / [i915#9685])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#9685]) -> [SKIP][500] ([i915#9685])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#8430]) -> [SKIP][502] ([i915#8430])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#6524]) -> [SKIP][504] ([i915#6524])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][505] ([i915#11520] / [i915#14544]) -> [SKIP][506] ([i915#11520]) +3 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][507] ([i915#11520]) -> [SKIP][508] ([i915#11520] / [i915#14544]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][509] ([i915#1072] / [i915#9732]) -> [SKIP][510] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          [SKIP][511] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][512] ([i915#1072] / [i915#9732]) +8 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#8623]) -> [SKIP][514] ([i915#8623])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][516] ([i915#15243] / [i915#3555])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_vrr@flip-basic.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][517] ([i915#9906]) -> [SKIP][518] ([i915#14544] / [i915#9906])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][519] ([i915#15243] / [i915#3555]) -> [SKIP][520] ([i915#14544] / [i915#15243] / [i915#3555])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-8/igt@kms_vrr@flip-dpms.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          [SKIP][521] ([i915#14544] / [i915#9906]) -> [SKIP][522] ([i915#9906])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@kms_vrr@max-min.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_vrr@max-min.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][524] ([i915#3291] / [i915#3708])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-rkl-6/igt@prime_vgem@basic-write.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@prime_vgem@basic-write.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15420
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
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
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8672 -> IGTPW_14233

  CI-20190529: 20190529
  CI_DRM_17704: 31985bb0a701138a06a5eb0b175b2a5c850cc4ee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14233: 6b3139c45abe848f04f81928dc920ecc481b73d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8672: 8672

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/index.html

--===============6985953394583377028==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: add helper funtion to re=
ad PAT table</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159189/">https://patchwork.freedesktop.org/series/159189/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14233/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14233/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8672_full -&gt; IGTPW_14233_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14233_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14233_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1423=
3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/i=
gt@kms_plane_cursor@viewport.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_cursor@viewport@pipe-a-=
hdmi-a-2-size-128.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14233_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@gem_bad_reloc@negative-reloc-lut=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-snb1/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> +104 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk6/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-snb1/igt@gem_ctx_persistence@legacy-engines=
-queued.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_exec_balancer@bonded-pair.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@gem_exec_big@single.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/117=
13">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@gem_exec_fence@submit3.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-=
contexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg=
2-5/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-=
fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@gem_lmem_swapping@massive-random=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk1/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#=
284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@gem_mmap@bad-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">=
i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@gem_mmap_wc@read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-=
after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@gem_pread@exhaustion.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658=
">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@gem_pxp@protected-raw-src-copy-n=
ot-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@gem_render_copy@linear-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@gem_tiling_max_stride.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-af=
ter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@gen9_exec_parse@valid-registers.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@i915_drm_fdinfo@busy-idle@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-7/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk5/igt@i915_suspend@basic-s3-without-i915=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-rkl-4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#481=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_addfb_basic@framebuffer-vs-s=
et-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-misma=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@kms_atomic_transition@plane-all-=
modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14233/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-1/igt@kms_big_fb@yf-tiled-addfb.html">S=
KIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-=
gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +166 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +103 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-y=
-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +174 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_chamelium_edid@hdmi-mode-tim=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_chamelium_frames@vga-frame-du=
mp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-each=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</=
li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-1/igt@kms_chamelium_hpd@hdmi-hpd-for-ea=
ch-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_content_protection@content-=
type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@suspend-r=
esume@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x=
42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/s=
hard-tglu-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-=
a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14233/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-h=
dmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_legacy@2x-cursor-vs-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915=
#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-6/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-10/igt@kms_fbcon_fbt@psr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469"=
>i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_flip@2x-flip-vs-expired-vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
c-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other=
 test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-snb5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_142=
33/shard-snb5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826"=
>i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-rkl-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a2.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#611=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8810">i915#8810</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8813">i915#8813</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i9=
15#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1=
 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915=
#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-shrfb-pgflip-blt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_frontbuffer_tracking@fbc-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/30=
23">i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#44=
23</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other tes=
t skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +15 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +16 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt=
@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 othe=
r test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-16/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk9/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 othe=
r tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 oth=
er tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9292">i915#9292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_pm_rpm@cursor.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/=
shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#=
15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk6/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-snb5/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@kms_psr2_sf@pr-plane-move-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-3/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr@fbc-pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@kms_psr@fbc-psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_psr@pr-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i=
915#9732</a>) +10 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_psr@pr-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-4/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk9/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-4/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-glk9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14233/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-1/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-mtlp-6/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-3/ig=
t@kms_vrr@negative-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15420">i915#15420</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-mtlp-7/igt@perf@global-sseu-config.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-18/igt@perf@per-context-mode-unprivileg=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-=
mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-tglu-2/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14233/shard-rkl-6/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/148=
09">i915#14809</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14233/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8672/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i91=
5_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_8672/shard-snb6/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb6/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb=
7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGT_8672/shard-snb4/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-=
snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/sha=
rd-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/=
shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb7/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_86=
72/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb5/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8672/shard-snb4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-snb1/igt@i915_module_loa=
d@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard=
-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
233/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14233/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb=
6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/=
shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14233/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14233/shard-snb4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-=
snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb5/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_142=
33/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb6/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14233/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-snb7/igt@i915_m=
odule_load@load.html">PASS</a>)</li>
<li>shard-glk10:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8672/shard-glk10/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8672/shard-glk10/igt@i915_mod=
ule_load@load.html">SKIP</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-glk10/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-=
glk10/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg1-13/igt@i915_suspend@basic-s2idle-without-i915.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-19/igt@i915_suspend@basic-s2id=
le-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4=
817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
233/shard-rkl-3/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14233/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14233/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-h=
dmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-move.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg1-12/igt@kms_frontbuffer_trac=
king@fbc-1p-primscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14233/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-tglu-10/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/sha=
rd-tglu-9/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132=
">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14233/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html">PASS<=
/a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14233/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915=
#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14233/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#=
13008</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14233/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#130=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-rkl-8/igt@gem_create@create-ext-cpu-acces=
s-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-8/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"=
>i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14233/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-rkl-1/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14233/shard-rkl-8/igt@gem_exec_reloc@basic-write-gtt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915=
#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14233/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14233/shard-rkl-4/igt@gem_lmem_swapping@verify.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#32=
82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_142=
33/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282=
">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#=
3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14233/shard-rkl-6/igt@gem_userptr_blits@relocations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2=
527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
233/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
27">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14233/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527=
">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14233/shard-rkl-4/igt@i915_pm_freq_api@freq-basic-api.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#=
8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4233/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14233/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4233/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fen=
cing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14233/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14233/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14233/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</=
a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@crc-prim=
ary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_ccs@crc=
-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-=
2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-cc=
s-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b=
-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_ccs@random-ccs-data-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#111=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14233/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i9=
15#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_chameliu=
m_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#=
6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@at=
omic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-8/igt@kms_content_protection@dp-mst-suspend-resume.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_content_protection@dp-mst-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-1/igt@kms_content_protection@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/694=
4">i915#6944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14233/shard-dg2-11/igt@kms_content_protection@suspend-resume.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#=
6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7162">i915#7162</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-8/igt@kms_content_=
protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_conten=
t_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14233/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@kms_cursor_le=
gacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i91=
5#4854</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14233/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_feature_discovery@display-4x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233=
/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_flip@2x-flip-vs-pannin=
g-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-1/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#151=
32</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_142=
33/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shar=
d-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscali=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yf=
tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233=
/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-down=
scaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@km=
s_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yf=
tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-va=
lid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-2/igt@km=
s_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#1=
0433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-ind=
fb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +16 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#18=
25</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/i=
gt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i9=
15#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3023">i915#3023</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprima=
ry.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-dg2-11/igt=
@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15=
102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3023">i915#3023</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
60">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14233/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14233/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@=
kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotati=
on@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_plane_scaling@plane=
-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-r=
kl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14233/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
30">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14233/shard-rkl-1/igt@kms_prime@basic-modeset-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14233/shard-rkl-3/igt@kms_psr2_sf@pr-ove=
rlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14233/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_psr@pr-sprite-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-rkl-4/igt@kms_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14233/shard-rkl-7/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#990=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1423=
3/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14233/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14233/shard-rkl-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8672/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14233/shard-rkl-5/igt@prime_vgem@basic-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8672 -&gt; IGTPW_14233</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17704: 31985bb0a701138a06a5eb0b175b2a5c850cc4ee @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14233: 6b3139c45abe848f04f81928dc920ecc481b73d4 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8672: 8672</p>

</body>
</html>

--===============6985953394583377028==--
