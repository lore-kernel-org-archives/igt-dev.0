Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A01C83F2E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9C110E6EB;
	Thu, 29 Aug 2024 14:50:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6864E10E6EA;
 Thu, 29 Aug 2024 14:50:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5724156668982660774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Fdrm=5Ffdin?=
 =?utf-8?q?fo=3A_Extend_mercy_to_the_upper_end_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Aug 2024 14:50:13 -0000
Message-ID: <172494301341.832386.3409480995522704822@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828145843.1786261-1-lucas.demarchi@intel.com>
In-Reply-To: <20240828145843.1786261-1-lucas.demarchi@intel.com>
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

--===============5724156668982660774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_drm_fdinfo: Extend mercy to the upper end (rev2)
URL   : https://patchwork.freedesktop.org/series/137750/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15312_full -> IGTPW_11655_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11655_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11655_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11655_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in IGTPW_11655_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8414]) +20 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414]) +10 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          [PASS][5] -> [FAIL][6] ([i915#7742])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#7697]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8562])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-mtlp:         [PASS][15] -> [FAIL][16] ([i915#12027])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-7/igt@gem_ctx_engines@invalid-engines.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8555]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][19] ([i915#11980])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][22] -> [FAIL][23] ([i915#5784])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-5/igt@gem_eio@reset-stress.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#4771])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#4036])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#4525]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#6334])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#2846])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][30] ([i915#2842]) +5 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][31] ([i915#2842]) +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3539]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#2842]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][35] -> [FAIL][36] ([i915#2842]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4473] / [i915#4771]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@gem_exec_fair@basic-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4812]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_gttfill@engines@vecs0:
    - shard-glk:          [PASS][42] -> [INCOMPLETE][43] ([i915#11895])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk8/igt@gem_exec_gttfill@engines@vecs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk5/igt@gem_exec_gttfill@engines@vecs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#5107])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +14 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4537])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4812]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#4613]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4565])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4613]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4077]) +20 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4077]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4083]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4083]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][66] ([i915#2658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4270]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4270]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_pxp@display-protected-crc.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190] / [i915#8428]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4079])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#8411])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4077]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3297] / [i915#3323])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4880]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3281] / [i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3281] / [i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][87] +41 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#2527]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-8/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#2527])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#6227])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][93] -> [ABORT][94] ([i915#9820])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][95] ([i915#9820])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#7091])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#11681]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4387])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#4387])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4387])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#4387])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#8437])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#7984])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#6245])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@i915_query@hwconfig_table.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#6245])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#5723])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4212]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#4212]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4215])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4215] / [i915#5190])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3826])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#10333])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-6/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#9531])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#9531])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#9531])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#9531])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#1769] / [i915#3555])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#5286]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5286]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4538] / [i915#5286]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][121] +19 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#3638]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3638]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][124] +8 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5190]) +15 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#5190])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#10656]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#10656])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#10656])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_big_joiner@invalid-modeset-force-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#10656])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#12042]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#6095]) +75 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#6095]) +23 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#12042]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#6095]) +174 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#12042]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6095]) +57 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#12042]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#12042])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3742])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#11616] / [i915#7213]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#7828]) +10 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#7828]) +12 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7828]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#7828]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7828]) +15 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7118] / [i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3299]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3116])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3116] / [i915#3299])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#7116])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#7116] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7118] / [i915#9424])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3555]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#8814])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#11453])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#11453])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3555]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#3555] / [i915#8814])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#11453]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#5354]) +48 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#9809])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4103] / [i915#4213]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#9833]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#9723])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#9723])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#9833])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#8588])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3555]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3555]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#8812])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3555] / [i915#3840]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555] / [i915#3840]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3955])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3469])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4854])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#1839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#1839])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-1/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#1839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#1839]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#658])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#658])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9934]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3637]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3637] / [i915#3966])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3637]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#8381])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#8381]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
    - shard-dg1:          [PASS][196] -> [FAIL][197] ([i915#2122]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-17/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html

  * igt@kms_flip@plain-flip-ts-check@b-vga1:
    - shard-snb:          [PASS][198] -> [FAIL][199] ([i915#2122]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-snb6/igt@kms_flip@plain-flip-ts-check@b-vga1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#2672]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2587] / [i915#2672]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#2672]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2587] / [i915#2672]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#5274])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          [PASS][206] -> [FAIL][207] ([i915#6880])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8708]) +20 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][209] +66 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#1825]) +13 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#5439])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3458]) +25 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#8708]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][214] +56 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#1825]) +52 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#3023]) +39 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9766])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9766])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#3458]) +18 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8708])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#433])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8228]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3555] / [i915#8228])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#6953] / [i915#9423])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][226] ([i915#8292])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][227] ([i915#8292])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#9423]) +28 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#9423]) +11 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9423]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#5176] / [i915#9423]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#9423]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#9728]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9728]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#5235]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#5235]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#5235]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#5235] / [i915#9423]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#5235]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#5235])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#9728]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#5354]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5978])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#9685]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#9340])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#9340])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][247] -> [SKIP][248] ([i915#9519])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#9519]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9519]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9519])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#9519])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#9519])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#6524] / [i915#6805])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#6524])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#11520]) +4 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#11520]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#11520]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#11520]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#9683])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#1072] / [i915#9732]) +22 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][262] +171 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#1072] / [i915#9673] / [i915#9732]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9732]) +11 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9688]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +23 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732]) +32 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#9685]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#11131] / [i915#4235])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#5289]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#11131] / [i915#5190])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#11131])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#5030]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#5030] / [i915#9041])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#8623])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#9906]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#9906])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#2437] / [i915#9412])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#2437])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2437])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#2436])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#7387])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@perf@global-sseu-config.html
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#7387])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2434])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#2435])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#2433])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#8850])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#8850])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3708])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3291] / [i915#3708])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3291] / [i915#3708])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#3708]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9917]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][294] ([i915#9781])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-glk:          NOTRUN -> [FAIL][295] ([i915#9781])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][296] ([i915#7742]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][298] ([i915#11713]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-9/igt@gem_exec_big@single.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [FAIL][300] ([i915#2842]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][302] ([i915#5493]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][304] ([i915#5566]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk3/igt@gen9_exec_parse@allowed-single.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][306] ([i915#9820]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][308] ([i915#9820]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [FAIL][310] ([i915#5956]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][312] ([i915#1257]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-4/igt@kms_dp_aux_dev.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_dp_aux_dev.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [FAIL][314] ([i915#6880]) -> [PASS][315] +2 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][316] ([i915#433]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][318] ([i915#9519]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][320] ([i915#9519]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][322] ([i915#9196]) -> [PASS][323] +2 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4:
    - shard-dg1:          [FAIL][324] ([i915#9196]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-dg2:          [FAIL][326] ([i915#4349]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs0.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          [FAIL][328] ([i915#4349]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-16/igt@perf_pmu@busy-double-start@vecs0.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@render-node-busy-idle@ccs0:
    - shard-mtlp:         [FAIL][330] ([i915#4349]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@ccs0.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html

  
#### Warnings ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][332] ([i915#12027]) -> [FAIL][333] ([i915#12065])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][334] ([i915#10131] / [i915#9697]) -> [ABORT][335] ([i915#10131] / [i915#9820])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][336] ([i915#8063]) -> [SKIP][337] ([i915#9424])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-4/igt@kms_content_protection@mei-interface.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][338] ([i915#9433]) -> [SKIP][339] ([i915#9424])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@kms_content_protection@mei-interface.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          [SKIP][340] ([i915#11453]) -> [SKIP][341] ([i915#11453] / [i915#3359])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][342] ([i915#10433] / [i915#3458]) -> [SKIP][343] ([i915#3458]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          [SKIP][344] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][345] ([i915#1072] / [i915#9732]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-gtt.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
    - shard-dg2:          [SKIP][346] ([i915#1072] / [i915#9732]) -> [SKIP][347] ([i915#1072] / [i915#9673] / [i915#9732]) +10 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][348] ([i915#11131] / [i915#5190]) -> [SKIP][349] ([i915#11131] / [i915#4235] / [i915#5190])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          [SKIP][350] ([i915#11131]) -> [SKIP][351] ([i915#11131] / [i915#4235])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html

  
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11895]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11895
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#12027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027
  [i915#12042]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042
  [i915#12065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12065
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#5978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7993 -> IGTPW_11655
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15312: da0e5d5784bc90f24d02e5944051f2e8a3f53b56 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11655: 76fe7a98df61d34bc772053e9ac76bbbe83526c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/index.html

--===============5724156668982660774==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_drm_fdinfo: Extend mercy to the upper end (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137750/">https://patchwork.freedesktop.org/series/137750/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15312_full -&gt; IGTPW_11655_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11655_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11655_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-snb-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11655_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-3:<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11655_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-7/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027">i915#12027</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980">i915#11980</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-5/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_fair@basic-pace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk8/igt@gem_exec_gttfill@engines@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk5/igt@gem_exec_gttfill@engines@vecs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11895">i915#11895</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_mmap_gtt@big-bo-tiledy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@gem_pxp@create-regular-context-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@gem_render_copy@y-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-6/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333">i915#10333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +19 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +174 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616">i915#11616</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966">i915#3966</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-17/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_flip@plain-flip-ts-check@b-hdmi-a4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-snb6/igt@kms_flip@plain-flip-ts-check@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978">i915#5978</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +171 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-5/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-1/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-4/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850">i915#8850</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850">i915#8850</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk9/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-9/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-glk3/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-16/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-16/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027">i915#12027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12065">i915#12065</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697">i915#9697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063">i915#8063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg1-16/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15312/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11655/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7993 -&gt; IGTPW_11655</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15312: da0e5d5784bc90f24d02e5944051f2e8a3f53b56 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11655: 76fe7a98df61d34bc772053e9ac76bbbe83526c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7993: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5724156668982660774==--
