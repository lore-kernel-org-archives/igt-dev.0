Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702DDE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 13:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1DD10ED09;
	Thu, 19 Dec 2024 13:33:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB01310ED0D;
 Thu, 19 Dec 2024 13:33:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Initial_PTL_support_=28r?=
 =?utf-8?q?ev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 13:33:24 -0000
Message-ID: <173461520495.415262.14538326305675318029@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

Series: Initial PTL support (rev5)
URL   : https://patchwork.freedesktop.org/series/141325/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12348_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12348_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12348_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12348_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-5/igt@gem_ctx_persistence@smoketest.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@full-late:
    - shard-dg1:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_exec_balancer@full-late.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_exec_balancer@full-late.html

  * igt@gem_mmap_gtt@close-race:
    - shard-snb:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@gem_mmap_gtt@close-race.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_sequence@get-forked:
    - shard-dg1:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_sequence@get-forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_sequence@get-forked.html

  * igt@kms_sequence@get-forked@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_sequence@get-forked@pipe-c-hdmi-a-4.html

  
Known issues
------------

  Here are the changes found in IGTPW_12348_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8411]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +23 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][20] -> [INCOMPLETE][21] ([i915#12392] / [i915#7297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7697]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@busy-create:
    - shard-rkl:          [PASS][25] -> [DMESG-WARN][26] ([i915#12964]) +27 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@gem_create@busy-create.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@gem_create@busy-create.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#6335])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-8/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg1:          [PASS][34] -> [DMESG-WARN][35] ([i915#4391] / [i915#4423])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-18/igt@gem_eio@in-flight-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][36] -> [FAIL][37] ([i915#12543] / [i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_eio@reset-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@full-late:
    - shard-mtlp:         [PASS][40] -> [FAIL][41] ([i915#13364])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-2/igt@gem_exec_balancer@full-late.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@gem_exec_balancer@full-late.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4525])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#11965]) +4 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +15 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][53] ([i915#7975] / [i915#8213]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][54] ([i915#7975] / [i915#8213]) +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#12193])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4565])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4077]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4083]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][69] ([i915#2658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         [PASS][73] -> [SKIP][74] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-8/igt@gem_pxp@create-regular-context-2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@gem_pxp@create-valid-protected-context.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#13033])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12964]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4270]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][81] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#8411]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][85] ([i915#13306])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][86] ([i915#13263])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@gem_userptr_blits@coherency-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#3323])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][95] ([i915#13356])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#2527]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8399])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][103] ([i915#2681]) +4 other tests warn
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#11681])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#11681])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#7984])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-7/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#7984])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][108] ([i915#9311]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb4/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][109] ([i915#9311])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][110] ([i915#7443])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][111] ([i915#4817]) +1 other test incomplete
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk2/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#7707])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4212])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#5190])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#5190])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#12454] / [i915#12712])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#8709]) +23 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#8709]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][121] ([i915#13287]) +1 other test incomplete
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][122] ([i915#13287]) +1 other test incomplete
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][123] ([i915#13287]) +3 other tests crash
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][124] ([i915#13287]) +3 other tests crash
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#12967] / [i915#6228])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          [PASS][126] -> [FAIL][127] ([i915#5956]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][128] -> [FAIL][129] ([i915#5956]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#5286]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#5286]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +13 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3638]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3638]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +9 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#6095]) +118 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#12313])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +114 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#6095]) +153 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#12313]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#12313]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +39 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6095]) +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#12805])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#6095]) +21 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#12313])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#6095]) +49 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#3742])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#7213]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3742])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4087]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#7828]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][160] +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7828]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828]) +13 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#7828]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#7828]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7116] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#3116] / [i915#3299]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6944] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7118])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#7118])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7116])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#6944] / [i915#7116] / [i915#7118])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#6944])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#13049])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#13049]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13049]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#13049])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3555]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-dg1:          [PASS][185] -> [DMESG-WARN][186] ([i915#4423]) +1 other test dmesg-warn
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@kms_cursor_crc@cursor-size-change.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][187] ([i915#12964]) +25 other tests dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#8814])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3555] / [i915#8814])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#13049]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][191] -> [DMESG-FAIL][192] ([i915#12964]) +1 other test dmesg-fail
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#4103] / [i915#4213])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#4103] / [i915#4213])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#4103]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#13046] / [i915#5354])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#9809])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#9067])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#4103])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#8588])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3804])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8812])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-1/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8812])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3840] / [i915#9053])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3955])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3469])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#9337])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#658])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#658])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3637]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3637]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9934]) +11 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9934]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8381])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#8381])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9934]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][224] -> [FAIL][225] ([i915#11989]) +1 other test fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#3637])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#8381])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#12745] / [i915#4839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#12745])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          NOTRUN -> [FAIL][230] ([i915#11989]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb4/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8810] / [i915#8813])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#8810])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#2672]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#2672]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555] / [i915#5190])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555]) +6 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#2587] / [i915#2672]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#5274])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][246] -> [DMESG-WARN][247] ([i915#12917] / [i915#12964])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#5354]) +30 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#1825]) +9 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-snb:          [PASS][250] -> [SKIP][251] +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][252] +27 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] +43 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][254] +44 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#5439])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#9766])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#3458]) +7 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#3023]) +43 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#1825]) +71 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][260] +422 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#8708]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#8708]) +17 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3458]) +14 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#8708]) +18 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#6118])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][266] -> [SKIP][267] ([i915#13012] / [i915#13030])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12713])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12713])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8228]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8228]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#3555] / [i915#8228])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#10656])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#10656])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12388])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#10656])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#12388])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#4070] / [i915#4816])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#13026]) +1 other test incomplete
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8821])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#3555]) +9 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8806])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#12247] / [i915#9423])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#12247]) +12 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#12247] / [i915#6953])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#6953]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#12247] / [i915#3555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#12247]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953] / [i915#9423])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#12247] / [i915#6953])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12247] / [i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12247]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#12247]) +12 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#12247]) +7 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#5354]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#9812])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#5354])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12343])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#12343])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12343])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9685])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#3828])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#3828])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#9685])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#3361])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][309] -> [SKIP][310] ([i915#9340])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#3828])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12916])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][313] -> [SKIP][314] ([i915#9519])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#9519])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#4077]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_pm_rpm@fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#4077]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#9519]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][319] -> [SKIP][320] ([i915#12916])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][321] ([i915#10553])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#6524])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#6524])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#6524])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#6524] / [i915#6805])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][326] ([i915#11520]) +9 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#11520]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#12316]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#9808])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#11520]) +17 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][331] ([i915#11520]) +9 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +11 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#11520]) +6 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#9683])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#9732]) +15 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][338] +379 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#9688]) +9 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#1072] / [i915#9732]) +20 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#9732]) +17 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#1072] / [i915#9732]) +14 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +42 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#12755]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#5289])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#5289]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#12755] / [i915#5190])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#5289])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#12755]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#3555] / [i915#5030] / [i915#9041])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#5030]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#5030] / [i915#9041])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-5/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][353] ([i915#13179]) +1 other test abort
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][354] ([i915#13179]) +1 other test abort
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][355] ([i915#5465]) +2 other tests fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#3555]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#8623])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#8623])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][359] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][360] -> [INCOMPLETE][361] ([i915#12276])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#9906])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-9/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#3555]) +4 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#11920])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#11920])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#11920])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-14/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#9906])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#9906])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#2437]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#2437] / [i915#9412])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][372] ([i915#2437])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#2437] / [i915#9412])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][374] +6 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#2435])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#2433])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][377] ([i915#4349]) +2 other tests fail
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-8/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#8850])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][379] ([i915#12549] / [i915#6806]) +1 other test fail
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-12/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#8516])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-mtlp:         NOTRUN -> [SKIP][381] ([i915#3708])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-3/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#3291] / [i915#3708])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-8/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#3291] / [i915#3708]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#3708]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#9917])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#9917]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#9917])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][388] ([i915#12910]) +18 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-10/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][389] ([i915#12910]) +9 other tests fail
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-7/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][390] ([i915#12910])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][391] +40 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][392] ([i915#5784]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@gem_eio@kms.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@gem_eio@kms.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][396] ([i915#5493]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][398] ([i915#10729]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglu:         [SKIP][400] ([i915#4270]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-on.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][402] ([i915#12964]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][404] ([i915#9820]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][406] ([i915#3591]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][408] ([i915#12797]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][410] ([i915#13010]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-2/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][412] ([i915#4817]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FAIL][414] ([i915#13314]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [DMESG-WARN][416] ([i915#12964]) -> [PASS][417] +22 other tests pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg1:          [DMESG-WARN][418] ([i915#4423]) -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][420] ([i915#1257]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-5/igt@kms_dp_aux_dev.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-10/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][422] ([i915#11989]) -> [PASS][423] +3 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2:          [FAIL][424] ([i915#11989]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
    - shard-dg1:          [FAIL][426] ([i915#11989]) -> [PASS][427] +2 other tests pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [FAIL][428] ([i915#11989]) -> [PASS][429] +4 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-tglu-6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-snb:          [SKIP][430] -> [PASS][431] +3 other tests pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/shard-sn

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12348/index.html
