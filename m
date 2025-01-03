Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E32BE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 20:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362FF10E34D;
	Fri,  3 Jan 2025 20:16:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F7D10E0C2;
 Fri,  3 Jan 2025 20:16:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/igt=5Fkms=3A_Backup_?=
 =?utf-8?q?connector_modes_before_sorting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 03 Jan 2025 20:16:53 -0000
Message-ID: <173593541318.2789119.6502848621309139381@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
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

Series: lib/igt_kms: Backup connector modes before sorting (rev2)
URL   : https://patchwork.freedesktop.org/series/142834/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15898_full -> IGTPW_12384_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12384_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12384_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12384_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_plane_cursor@overlay:
    - shard-mtlp:         [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-6/igt@kms_plane_cursor@overlay.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
    - shard-mtlp:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-6/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128.html

  * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64:
    - shard-mtlp:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-6/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-64.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15898_full and IGTPW_12384_full:

### New IGT tests (2) ###

  * igt@gem_render_copy@linear-to-vebox-y-tiled@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@gem_render_copy@yf-tiled-to-vebox-linear@lmem0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_12384_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#8411]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +33 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#6335]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#6335]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#12353])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#280]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][32] -> [FAIL][33] ([i915#5784])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-18/igt@gem_eio@kms.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][34] -> [FAIL][35] ([i915#12543] / [i915#5784])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-1/igt@gem_eio@reset-stress.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][36] ([i915#8898])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4812]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4525]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-9/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +10 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +14 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +10 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][52] ([i915#7975] / [i915#8213]) +1 other test abort
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-3/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [PASS][53] -> [ABORT][54] ([i915#7975] / [i915#8213]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-17/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4860])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#2190])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][62] -> [TIMEOUT][63] ([i915#5493]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#12193])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4565])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4083]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4083])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-8/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +9 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4077]) +7 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4077])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-2/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          [PASS][71] -> [DMESG-WARN][72] ([i915#12917] / [i915#12964])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-4/igt@gem_mmap_gtt@medium-copy-odd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-3/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#3282])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3282]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][76] ([i915#2658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-3/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3282]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12964]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4270])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4270]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-tglu:         [PASS][82] -> [SKIP][83] ([i915#4270]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-10/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4270]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][85] ([i915#12917] / [i915#12964])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#5190] / [i915#8428]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#8428])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4079]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4885])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][90] ([i915#13263] / [i915#13449])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#3323])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][97] +382 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb5/igt@gem_vm_create@invalid-create.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][98] ([i915#13356]) +1 other test incomplete
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][99] -> [DMESG-FAIL][100] ([i915#12964])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#2856])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#2856]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][107] ([i915#9820])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][108] -> [ABORT][109] ([i915#12817] / [i915#9820])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#7091])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#8399])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#11681] / [i915#6621])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#11681] / [i915#6621])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#11681] / [i915#6621])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11681])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#5723])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][117] ([i915#9311]) +1 other test dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][118] ([i915#9311]) +1 other test dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][119] ([i915#9311])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> [ABORT][120] ([i915#13010]) +1 other test abort
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@i915_selftest@perf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][121] ([i915#4817])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#5190]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4212]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#8709]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#8709]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#12967] / [i915#6228])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#10333]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-4/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#1769] / [i915#3555])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#1769] / [i915#3555])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][130] ([i915#1769] / [i915#3555])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][131] ([i915#11808]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +9 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5286]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5286]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#5286]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3638]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3638]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6187])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5190]) +13 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][141] +85 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#6095]) +14 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#10307] / [i915#6095]) +160 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +79 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +100 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][148] ([i915#12796]) +1 other test incomplete
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#6095]) +24 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#12313]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#12313]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#6095]) +29 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#12313]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#6095]) +163 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#7828]) +10 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#7828]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#7828]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#7828]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7828]) +10 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][164] -> [SKIP][165] ([i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-10/igt@kms_color@deep-color.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-11/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-7/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3116] / [i915#3299]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3299])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3116])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#9424]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#7118] / [i915#9424]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#13049]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3555]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#13049])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#13049]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#8814]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#3555]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][182] -> [DMESG-WARN][183] ([i915#12964]) +35 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3555]) +8 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#13049]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#13049])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][187] ([i915#12964]) +26 other tests dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3555] / [i915#8814])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#13046] / [i915#5354]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][191] +28 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#9809])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][193] ([i915#2346]) +1 other test fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#9067])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#4103])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9833])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#9723])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#9723])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#9833])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555]) +8 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8588])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#8588])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#8588])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3804])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3804])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#12402])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#12402])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8812])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3469])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#4854])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-5/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#4854])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#4854])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#1839])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#658])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#658]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#658]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#4881])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#4881])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#9934]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#3637]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8381])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#3637]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3637])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9934]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#9934]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-mtlp:         [PASS][230] -> [FAIL][231] ([i915#11989]) +2 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-1/igt@kms_flip@blocking-wf_vblank.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#8381])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#2672]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#2672]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          [PASS][245] -> [FAIL][246] ([i915#6880]) +2 other tests fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5354]) +28 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][248] +39 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#8708]) +18 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][250] ([i915#118])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#5439]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#8708]) +22 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#1825]) +58 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] +41 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#9766])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#3458]) +18 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3023]) +34 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#3458]) +15 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#1825]) +8 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#8708]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8228]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#3555] / [i915#8228])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@global-basic:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#13388]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_histogram@global-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#13388])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#13388])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_histogram@global-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#10656])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#10656])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#12388])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#12339])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#4816])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#1839])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#1839]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#6301])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#6301])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#6301])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][277] ([i915#12756] / [i915#13409])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][278] ([i915#13026]) +1 other test incomplete
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][279] ([i915#10647] / [i915#12169])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][280] ([i915#10647]) +3 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][281] ([i915#10647] / [i915#12177])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#13046] / [i915#5354] / [i915#9423])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#12247]) +18 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12247]) +12 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12247] / [i915#9423])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#12247]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#12247] / [i915#6953])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#12247]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#12247] / [i915#3555])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#12247]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#12343])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9685])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#9685])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#3828])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3828])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#3361])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9340])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][304] -> [SKIP][305] ([i915#9519])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][307] ([i915#10553])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#6524] / [i915#6805])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#6524])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#12316]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#11520]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#11520]) +9 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#11520]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#11520]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#11520]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#11520]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][317] ([i915#11520]) +8 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#9683]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#1072] / [i915#9732]) +13 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9732]) +22 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#9688]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +31 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +24 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#4077] / [i915#9688]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-6/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#9732]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][326] +579 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#5289])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#5289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#5289]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#5289]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12755]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#3555]) +6 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][333] ([i915#13179]) +1 other test abort
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-snb5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#3555] / [i915#8809])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][335] ([i915#10959])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#8623])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#8623])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#8623])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][339] +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][340] ([i915#12276]) +1 other test incomplete
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#8808] / [i915#9906])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9906])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][343] ([i915#9906])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#2437] / [i915#9412])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#2437])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#2437])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][347] ([i915#2437]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#2437])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-7/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#2437])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#2434])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-1/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#2435])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy:
    - shard-dg1:          NOTRUN -> [FAIL][352] ([i915#4349]) +5 other tests fail
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-17/igt@perf_pmu@busy.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][353] +16 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-10/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][354] ([i915#12964])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][355] ([i915#4349])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#3291] / [i915#3708]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-7/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#3291] / [i915#3708])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#3708])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#3708]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#9917]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#9917]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#9917])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][363] ([i915#12910]) +9 other tests fail
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][364] ([i915#12910]) +9 other tests fail
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@gem_ctx_param@invalid-ctx-set:
    - shard-rkl:          [DMESG-WARN][365] ([i915#12964]) -> [PASS][366] +31 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-1/igt@gem_ctx_param@invalid-ctx-set.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-4/igt@gem_ctx_param@invalid-ctx-set.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-dg2:          [INCOMPLETE][367] -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-3/igt@gem_exec_endless@dispatch@ccs0.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [SKIP][369] -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][371] ([i915#10729]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [INCOMPLETE][373] ([i915#13356]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-5/igt@gem_workarounds@suspend-resume.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][375] ([i915#12964]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [DMESG-WARN][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400]) ([i915#118]) -> ([PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk6/igt@i915_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@i915_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk2/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk6/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk8/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk1/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk8/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk2/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk5/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk4/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk3/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk9/igt@i915_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk9/igt@i915_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk9/igt@i915_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk9/igt@i915_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@i915_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@i915_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk8/igt@i915_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@i915_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@i915_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@i915_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@i915_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk6/igt@i915_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk6/igt@i915_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@i915_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@i915_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@i915_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk5/igt@i915_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk1/igt@i915_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk4/igt@i915_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk4/igt@i915_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk2/igt@i915_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@i915_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@i915_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@i915_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk2/igt@i915_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk2/igt@i915_module_load@load.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][426] ([i915#3591]) -> [PASS][427] +1 other test pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - shard-tglu:         [ABORT][428] ([i915#12061] / [i915#13010]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-5/igt@i915_selftest@live.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@i915_selftest@live.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [INCOMPLETE][430] ([i915#4817]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [INCOMPLETE][432] ([i915#12761] / [i915#1982]) -> [PASS][433] +1 other test pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@kms_async_flips@async-flip-suspend-resume.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          [INCOMPLETE][434] ([i915#13287] / [i915#9878]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-2/igt@kms_async_flips@crc.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_async_flips@crc.html
    - shard-tglu:         [INCOMPLETE][436] ([i915#13287] / [i915#9878]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-2/igt@kms_async_flips@crc.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-7/igt@kms_async_flips@crc.html
    - shard-glk:          [INCOMPLETE][438] ([i915#9878]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@kms_async_flips@crc.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@kms_async_flips@crc.html
    - shard-dg2:          [WARN][440] ([i915#13287]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-11/igt@kms_async_flips@crc.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-5/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-tglu:         [INCOMPLETE][442] ([i915#13287]) -> [PASS][443] +2 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-tglu-3/igt@kms_async_flips@crc-atomic.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-tglu-6/igt@kms_async_flips@crc-atomic.html
    - shard-glk:          [INCOMPLETE][444] ([i915#13287] / [i915#13423]) -> [PASS][445] +1 other test pass
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk6/igt@kms_async_flips@crc-atomic.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@kms_async_flips@crc-atomic.html
    - shard-dg2:          [INCOMPLETE][446] ([i915#13287]) -> [PASS][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-dg2-10/igt@kms_async_flips@crc-atomic.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-dg2-2/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][448] ([i915#13287]) -> [PASS][449]
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-glk7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-glk7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
    - shard-rkl:          [INCOMPLETE][450] ([i915#13287]) -> [PASS][451]
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/shard-rkl-7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][452] ([i915#5138]) -> [PASS][453]
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15898/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12384/index.html
