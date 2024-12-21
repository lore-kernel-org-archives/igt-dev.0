Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34CCE7718B
	for <igt-dev@archiver.kernel.org>; Sat, 21 Dec 2024 15:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A910E12D;
	Sat, 21 Dec 2024 15:06:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA0610E060;
 Sat, 21 Dec 2024 15:06:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel=3A_Remove_TE?=
 =?utf-8?q?ST_field_from_test_documentation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 21 Dec 2024 15:06:37 -0000
Message-ID: <173479359782.1305369.9203238600888378296@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220093914.706003-1-pravalika.gurram@intel.com>
In-Reply-To: <20241220093914.706003-1-pravalika.gurram@intel.com>
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

Series: tests/intel: Remove TEST field from test documentation
URL   : https://patchwork.freedesktop.org/series/142877/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8168_full -> IGTPW_12361_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12361_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12361_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12361_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x128:
    - shard-snb:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb7/igt@kms_cursor_crc@cursor-random-128x128.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb2/igt@kms_cursor_crc@cursor-random-128x128.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][4] +2 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb4/igt@kms_flip@2x-modeset-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_histogram@algo-basic:
    - shard-tglu:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_histogram@algo-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-dg2:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@kms_histogram@algo-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_histogram@algo-color.html

  * igt@perf_pmu@busy-accuracy-2@vecs0:
    - shard-mtlp:         [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-4/igt@perf_pmu@busy-accuracy-2@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-5/igt@perf_pmu@busy-accuracy-2@vecs0.html

  
#### Warnings ####

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][11] ([i915#13287]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_create@create-ext-cpu-access-big:
    - {shard-dg2-9}:      NOTRUN -> [ABORT][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-9/igt@gem_create@create-ext-cpu-access-big.html

  
Known issues
------------

  Here are the changes found in IGTPW_12361_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#6230])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8414])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-2/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#13008])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#6335]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][27] -> [FAIL][28] ([i915#9561]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][29] -> [INCOMPLETE][30] ([i915#12353])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][34] ([i915#10030] / [i915#7975] / [i915#8213])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][35] ([i915#8898])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4525]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4525]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#6334]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281]) +20 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4537] / [i915#4812])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4812]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#2190])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#4613] / [i915#7582])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#12193])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4565])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#4613])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#284])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4083]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][61] ([i915#12917] / [i915#12964])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_gtt@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@gem_mmap_gtt@pf-nonblock.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][63] -> [ABORT][64] ([i915#10729]) +1 other test abort
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4083])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-3/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb2/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][72] ([i915#12917] / [i915#12964]) +5 other tests timeout
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][76] +399 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#8411])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4077]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3282] / [i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3282] / [i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4880])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3281] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3281] / [i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#4958])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#3297]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][93] +434 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb2/igt@gem_vm_create@invalid-create.html

  * igt@gen3_render_mixed_blits:
    - shard-dg2:          NOTRUN -> [SKIP][94] +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][96] -> [ABORT][97] ([i915#5566])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4881])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@i915_fb_tiling.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123]) -> ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [DMESG-WARN][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146]) ([i915#118])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk3/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk1/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk9/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk1/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk9/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk5/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk2/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk5/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk4/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk7/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk4/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk3/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk9/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk2/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk7/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk6/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk6/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk7/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk4/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk2/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk7/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk4/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk5/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk5/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk6/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk6/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk6/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][147] -> [ABORT][148] ([i915#9820])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#8399]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#8399])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][151] ([i915#2681]) +1 other test warn
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          NOTRUN -> [FAIL][152] ([i915#3591]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][153] -> [INCOMPLETE][154] ([i915#12797])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#11681] / [i915#6621])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#11681] / [i915#6621])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [INCOMPLETE][157] ([i915#7790])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4387])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#4387])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#4387])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8437])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5723])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#5723])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][164] ([i915#9311]) +1 other test dmesg-warn
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb4/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][165] ([i915#9311]) +1 other test dmesg-warn
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu-1:       NOTRUN -> [ABORT][166] ([i915#13010]) +1 other test abort
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@i915_selftest@perf.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7707])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@intel_hwmon@hwmon-write.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7707])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4212]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-mtlp:         [PASS][170] -> [FAIL][171] ([i915#10991]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][172] ([i915#12964]) +39 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#8709]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][174] ([i915#13287] / [i915#9878])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][175] ([i915#13287]) +1 other test incomplete
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][176] ([i915#13287]) +1 other test incomplete
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#9531])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          NOTRUN -> [FAIL][178] ([i915#12238])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-glk:          NOTRUN -> [FAIL][179] ([i915#11859])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#1769] / [i915#3555])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#1769] / [i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          NOTRUN -> [FAIL][182] ([i915#5956]) +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#4538] / [i915#5286]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#5286])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#5286])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5286]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#5286]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3638]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3638]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4538] / [i915#5190]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5190]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][193] +36 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#4538]) +6 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#6095]) +145 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#12313]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#6095]) +104 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#6095]) +59 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#12313]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#12313])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#6095]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#12805])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#6095]) +19 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][204] ([i915#12796])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#6095]) +44 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#12313])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#10307] / [i915#6095]) +127 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#7213]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3742])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3742])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#7828]) +8 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#7828]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#7828]) +13 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#7828]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#7828]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#7828])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9424])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3116]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#6944] / [i915#9424])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [TIMEOUT][222] ([i915#7173]) +1 other test timeout
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#7118])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#6944] / [i915#7116] / [i915#7118])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#7118] / [i915#9424])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#7118] / [i915#9424])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#7116] / [i915#9424])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#13049]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#8814])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#13049])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#13049])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#13049]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3555]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#13049]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#3555]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][236] ([i915#12358] / [i915#7882])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][237] ([i915#12358])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#13046] / [i915#5354])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#4103] / [i915#4213])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#4103]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][241] -> [FAIL][242] ([i915#2346])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][243] -> [FAIL][244] ([i915#2346])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9067])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#4103]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9833])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#9723])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9723])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#9833])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#3555]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][252] -> [SKIP][253] ([i915#1257])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-10/igt@kms_dp_aux_dev.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-5/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#1257])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#1257])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#12402])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#12402])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#12402])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          [PASS][259] -> [DMESG-WARN][260] ([i915#12964]) +34 other tests dmesg-warn
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-rkl-4/igt@kms_draw_crc@draw-method-pwrite.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#3840]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#3555] / [i915#3840])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#3840])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#3555] / [i915#3840])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#2065] / [i915#4854])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#1839])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#1839])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9934]) +9 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][269] ([i915#12745] / [i915#4839])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#3637]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][271] ([i915#4839])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9934]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9934]) +17 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][274] -> [FAIL][275] ([i915#11989]) +1 other test fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#3637]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-snb:          NOTRUN -> [FAIL][277] ([i915#11989]) +1 other test fail
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][278] ([i915#11989]) +1 other test fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#2587] / [i915#2672]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#2672]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#2587] / [i915#2672] / [i915#3555])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#2587] / [i915#2672]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +5 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#2672] / [i915#3555]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#2587] / [i915#2672]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#2672] / [i915#3555]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg1:          [PASS][289] -> [DMESG-WARN][290] ([i915#4423]) +1 other test dmesg-warn
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg1:          [PASS][291] -> [ABORT][292] ([i915#4423])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-13/igt@kms_force_connector_basic@force-connector-state.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#8708]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#5354]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][295] +49 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][296] -> [SKIP][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][298] -> [FAIL][299] ([i915#6880]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#5439])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] +33 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#1825])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#1825]) +51 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#3023]) +34 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#5439])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3458]) +9 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][307] +97 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#8708]) +20 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#3458]) +16 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#3555] / [i915#8228])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3555] / [i915#8228]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#3555] / [i915#8228])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#3555] / [i915#8228]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-5/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#12339])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#12388])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#10656])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#12394])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#12394])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#12339])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#1839])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#6301])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#6301])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][323] ([i915#13026])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][324] ([i915#12178])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][325] ([i915#7862]) +1 other test fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#6953])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#12247]) +14 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#12247]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12247] / [i915#6953]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#12247] / [i915#6953])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#12247]) +8 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#12247]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#9812])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#5354])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#9812])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_pm_backlight@fade.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#5354])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#9685])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#3828])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#3361])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#3828])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#3828]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#8430])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#12916]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][345] -> [SKIP][346] ([i915#9519])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9519])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9519])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#6524])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#11520]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#11520]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][352] ([i915#11520]) +15 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#11520]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#11520]) +10 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#12316])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#11520]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][357] ([i915#11520]) +7 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#9683]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#9683])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#9688])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#1072] / [i915#9732]) +12 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#1072] / [i915#9732]) +34 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#9732]) +24 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#1072] / [i915#9732]) +23 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#9732]) +8 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9685])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#9685])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#5289])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#12755])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#5289])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#5289]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#3555]) +5 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][373] ([i915#13179]) +1 other test abort
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#3555])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#8623])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         [PASS][376] -> [FAIL][377] ([i915#9196]) +1 other test fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][378] -> [INCOMPLETE][379] ([i915#12276])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][380] ([i915#12276]) +1 other test incomplete
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#9906]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#9906]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#9906]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#2437])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][385] ([i915#2437])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#2437] / [i915#9412])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][387] ([i915#2437]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#2437] / [i915#9412])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#8850])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-dg2:          [PASS][390] -> [FAIL][391] ([i915#11943]) +3 other tests fail
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-6/igt@perf_pmu@most-busy-check-all.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-2/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-mtlp:         [PASS][392] -> [FAIL][393] ([i915#11943]) +6 other tests fail
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-6/igt@perf_pmu@most-busy-check-all@bcs0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-5/igt@perf_pmu@most-busy-check-all@bcs0.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-dg1:          [PASS][394] -> [FAIL][395] ([i915#11943]) +4 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-12/igt@perf_pmu@most-busy-check-all@rcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@perf_pmu@most-busy-check-all@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#8516])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy:
    - shard-dg2:          NOTRUN -> [FAIL][397] ([i915#4349]) +1 other test fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@perf_pmu@render-node-busy.html

  * igt@perf_pmu@render-node-busy@vcs1:
    - shard-mtlp:         [PASS][398] -> [FAIL][399] ([i915#4349]) +2 other tests fail
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-7/igt@perf_pmu@render-node-busy@vcs1.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-1/igt@perf_pmu@render-node-busy@vcs1.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#3291] / [i915#3708])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#3708])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#3708])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#9917]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][404] ([i915#12910]) +9 other tests fail
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#9917]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][406] ([i915#12910])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][407] ([i915#13363]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-tglu-3/igt@gem_eio@kms.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-8/igt@gem_eio@kms.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-rkl:          [TIMEOUT][409] ([i915#3778]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-rkl-2/igt@gem_exec_endless@dispatch@rcs0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][411] ([i915#7975] / [i915#8213]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg1:          [INCOMPLETE][413] -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-13/igt@gem_lmem_swapping@parallel-random.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         [SKIP][415] ([i915#4270]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][417] -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          [DMESG-WARN][419] ([i915#4423]) -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@128x128-top-edge@pipe-c-hdmi-a-1:
    - shard-glk:          [DMESG-FAIL][421] ([i915#118]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-c-hdmi-a-1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk3/igt@kms_cursor_edge_walk@128x128-top-edge@pipe-c-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-snb:          [SKIP][423] -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [FAIL][425] ([i915#6880]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][427] ([i915#3555] / [i915#8228]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][429] ([i915#12388]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [INCOMPLETE][431] ([i915#13026]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][433] ([i915#4281]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][435] ([IGT#160]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-1/igt@kms_sysfs_edid_timing.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-10/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@wait-forked@pipe-c-hdmi-a-1:
    - shard-glk:          [DMESG-WARN][437] ([i915#118]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk8/igt@kms_vblank@wait-forked@pipe-c-hdmi-a-1.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk1/igt@kms_vblank@wait-forked@pipe-c-hdmi-a-1.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [DMESG-WARN][439] ([i915#12964]) -> [PASS][440] +19 other tests pass
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-rkl-7/igt@perf@polling@0-rcs0.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-rkl-5/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][441] ([i915#4349]) -> [PASS][442] +4 other tests pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-mtlp:         [FAIL][443] ([i915#4349]) -> [PASS][444] +5 other tests pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-mtlp-5/igt@perf_pmu@semaphore-busy@rcs0.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-mtlp-3/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][445] ([i915#4349]) -> [PASS][446] +1 other test pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [INCOMPLETE][447] -> [INCOMPLETE][448] ([i915#13197])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk1/igt@gem_eio@in-flight-suspend.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk8/igt@gem_eio@in-flight-suspend.html

  * igt@kms_async_flips@crc:
    - shard-glk:          [INCOMPLETE][449] ([i915#13287] / [i915#9878]) -> [INCOMPLETE][450] ([i915#9878])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk5/igt@kms_async_flips@crc.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk9/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          [SKIP][451] ([i915#1769] / [i915#3555]) -> [SKIP][452] ([i915#1769] / [i915#3555] / [i915#4423])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg1:          [SKIP][453] ([i915#7828]) -> [SKIP][454] ([i915#4423] / [i915#7828])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-dg1-18/igt@kms_chamelium_edid@dp-mode-timings.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-dg1-14/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_content_protection@type1:
    - shard-snb:          [INCOMPLETE][455] ([i915#8816]) -> [SKIP][456]
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-snb4/igt@kms_content_protection@type1.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-snb5/igt@kms_content_protection@type1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][457] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][458] ([i915#12745] / [i915#1982] / [i915#4839])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8168/shard-glk7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/shard-glk7/igt@kms_flip@2x-flip-vs-susp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12361/index.html
