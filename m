Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448FDCE837A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 07:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019C310E5E5;
	Tue,  1 Oct 2024 07:12:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C994510E5E5;
 Tue,  1 Oct 2024 07:12:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0581831991191322599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Add_test_for_fault_injectio?=
 =?utf-8?q?n_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 01 Oct 2024 07:12:43 -0000
Message-ID: <172776676380.1140706.17243137683162337769@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930141248.810483-1-francois.dugast@intel.com>
In-Reply-To: <20240930141248.810483-1-francois.dugast@intel.com>
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

--===============0581831991191322599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add test for fault injection (rev2)
URL   : https://patchwork.freedesktop.org/series/139059/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15461_full -> IGTPW_11840_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11840_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11840_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11840_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_gttfill@engines:
    - shard-mtlp:         [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@gem_exec_gttfill@engines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@gem_exec_gttfill@engines.html

  * igt@gem_mmap_offset@clear:
    - shard-dg1:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-19/igt@gem_mmap_offset@clear.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@gem_mmap_offset@clear.html

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][6] -> [ABORT][7] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-4/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@perf@blocking:
    - shard-mtlp:         [PASS][15] -> [FAIL][16] +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@perf@blocking.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@perf@blocking.html

  
#### Warnings ####

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          [SKIP][17] ([i915#4423]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - {shard-tglu-1}:     NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15461_full and IGTPW_11840_full:

### New IGT tests (5) ###

  * igt@kms_lease@lease-again@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.12] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_plane_multiple@tiling-x@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  

Known issues
------------

  Here are the changes found in IGTPW_11840_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9318])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#11078])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@busy-idle@vecs0:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8414]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@drm_fdinfo@busy-idle@vecs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8414]) +17 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#7697]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3555] / [i915#9323]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#3555] / [i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#9323]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#9323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][35] ([i915#7297])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#7697])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#9310])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6335])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][39] ([i915#1099]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][44] -> [ABORT][45] ([i915#7975] / [i915#8213])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-18/igt@gem_eio@hibernate.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          NOTRUN -> [FAIL][46] ([i915#5784])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4812]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4812]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4812]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4525]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [FAIL][51] ([i915#6117])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#6344])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-dg1:          [PASS][53] -> [TIMEOUT][54] ([i915#3778]) +1 other test timeout
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-13/igt@gem_exec_endless@dispatch@bcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          NOTRUN -> [FAIL][55] ([i915#2846])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][57] ([i915#2842]) +5 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][58] ([i915#2842]) +4 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-rkl:          [PASS][59] -> [FAIL][60] ([i915#2842]) +3 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-7/igt@gem_exec_fair@basic-pace-share.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4473] / [i915#4771]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gem_exec_fair@basic-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3539]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-mtlp:         [PASS][65] -> [INCOMPLETE][66] ([i915#11895])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@gem_exec_gttfill@engines@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@gem_exec_gttfill@engines@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3281]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3281]) +15 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3281]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_exec_reloc@basic-scanout.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3281]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4537] / [i915#4812])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4860]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4860]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4860])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#2190])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4613] / [i915#7582])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4613])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4613]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8289])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#8289])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4077]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4083]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4083]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_mmap_wc@read-write-distinct.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4083]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3282]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#3282]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +11 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +10 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#4270]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4270]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4270]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#4270]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8428]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4079]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#8411])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4077]) +13 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4079]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#3323])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3297] / [i915#4880])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3281] / [i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#2856]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#2527]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2856]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][114] -> [ABORT][115] ([i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [PASS][116] -> [ABORT][117] ([i915#9820])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][118] -> [ABORT][119] ([i915#10131] / [i915#10887])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [PASS][120] -> [ABORT][121] ([i915#9820])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#6412])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#7178])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#6412])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6412])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#8399])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][127] ([i915#2681]) +1 other test warn
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#11681])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#11681])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#11681])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#4387])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][132] -> [SKIP][133] ([i915#7984])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@i915_power@sanity.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@i915_power@sanity.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][134] ([i915#9311]) +1 other test dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@i915_selftest@mock.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#7707])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#7707])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-dg1:          [PASS][137] -> [DMESG-WARN][138] ([i915#4423]) +2 other tests dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_addfb_basic@unused-handle.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#8709]) +11 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#8709]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#8709]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#8709]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#8709]) +11 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#9531])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#9531])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#9531])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][148] -> [SKIP][149] ([i915#9197]) +22 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#5286]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#5286]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5286]) +8 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#9197]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][154] +12 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-mtlp:         [PASS][155] -> [FAIL][156] ([i915#5138])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4538] / [i915#5190]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3638]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3638]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#5190] / [i915#9197]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5190])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#4538]) +8 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6095]) +64 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#12313]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#12313]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#6095]) +97 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#12313]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#6095]) +24 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#10307] / [i915#6095]) +159 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#12313])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#12313]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#6095]) +124 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3742])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3742])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#11616] / [i915#7213]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4087]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][178] +14 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#7828]) +10 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7828]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#7828]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#7828]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#7828]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [TIMEOUT][185] ([i915#7173])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3116] / [i915#3299]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3116])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3299]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#6944] / [i915#9424])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_content_protection@lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#6944] / [i915#9424])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_content_protection@lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9424])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9424])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9424]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#7118] / [i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3555]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#8814])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#11453])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#11453])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3555]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8814])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#11453]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#11453])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#4103]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#9809])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [PASS][206] -> [FAIL][207] ([i915#2346])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#4103])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#8588])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3804])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3804])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#1257])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3840] / [i915#9688])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#3840])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3840] / [i915#9688])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#3955])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2065] / [i915#4854])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#1839])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#9337])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#658])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4881])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3637]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][226] -> [FAIL][227] ([i915#2122]) +5 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#3637]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][229] -> [FAIL][230] ([i915#10826]) +1 other test fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][231] +31 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#8381])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#8381])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#8381])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2:          [PASS][235] -> [SKIP][236] ([i915#5354]) +10 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-1/igt@kms_flip@plain-flip-ts-check.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-mtlp:         [PASS][237] -> [FAIL][238] ([i915#2122]) +2 other tests fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2:          [PASS][239] -> [SKIP][240] ([i915#3555]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#2672]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2672]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672] / [i915#3555])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#2672]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-snb:          [PASS][253] -> [SKIP][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#8708]) +16 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][256] +48 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1825]) +49 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#8708]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#8708]) +7 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][260] +114 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3023]) +35 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#5439])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#10055])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#9766])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#9766])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#3458]) +10 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#3458]) +16 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#5354]) +36 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#1825]) +15 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8228]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          [PASS][271] -> [SKIP][272] ([i915#3555] / [i915#8228])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_hdr@static-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8228])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#8825])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@kms_plane@plane-panning-bottom-right.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][279] ([i915#8292])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][280] ([i915#8292]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#12247]) +17 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#12247]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#8152] / [i915#9423])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#12247] / [i915#8152]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12247] / [i915#9423]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12247]) +19 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#6953])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#6953] / [i915#8152] / [i915#9423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#12247]) +13 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12247] / [i915#3555])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#12247] / [i915#3555] / [i915#6953])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12247]) +13 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#12247] / [i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9812]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#5354])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#5354]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#9685])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#10139])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#5978])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#3361])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3361])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#8430])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#1849])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][305] -> [SKIP][306] ([i915#9519]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#9519]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9519])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9519]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#9519]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#6524])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#6524] / [i915#6805])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#6524])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#9808]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#12316]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#11520]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#11520]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][320] ([i915#11520]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#11520]) +10 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#11520]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#9683])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#9683]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#9688]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-snb:          NOTRUN -> [SKIP][326] +100 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb5/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#1072] / [i915#9732]) +21 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9732]) +25 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +16 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +31 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#9685]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#9685])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11131]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#3555]) +7 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][335] ([i915#12231]) +1 other test abort
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8809])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][337] ([i915#5465]) +2 other tests fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         [PASS][338] -> [FAIL][339] ([i915#9196]) +1 other test fail
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9906])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3555] / [i915#9906])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#2437] / [i915#9412])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#2437])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#2437])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#2433])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#2433])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][347] -> [FAIL][348] ([i915#4349]) +10 other tests fail
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg1:          [PASS][349] -> [FAIL][350] ([i915#4349]) +3 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@busy-idle@vcs1:
    - shard-mtlp:         [PASS][351] -> [FAIL][352] ([i915#4349]) +4 other tests fail
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-5/igt@perf_pmu@busy-idle@vcs1.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@perf_pmu@busy-idle@vcs1.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][353] ([i915#6806]) +1 other test fail
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@perf_pmu@frequency@gt0.html
    - shard-dg1:          NOTRUN -> [FAIL][354] ([i915#6806]) +1 other test fail
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@perf_pmu@frequency@gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#3291] / [i915#3708])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#3291] / [i915#3708]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#3708])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][358] ([i915#9781]) +1 other test fail
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-rkl:          NOTRUN -> [FAIL][359] ([i915#9781]) +1 other test fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][360] ([i915#9781])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-snb:          NOTRUN -> [FAIL][361] ([i915#9781])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb2/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-tglu:         NOTRUN -> [FAIL][362] ([i915#9781])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-mtlp:         NOTRUN -> [FAIL][363] ([i915#9781])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@syncobj_timeline@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@fbdev@pan:
    - shard-dg2:          [SKIP][364] ([i915#2582]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@fbdev@pan.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@fbdev@pan.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][366] ([i915#7297]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][368] ([i915#12027]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg2:          [INCOMPLETE][370] -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@gem_ctx_isolation@preservation-s3.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3.html
    - shard-dg1:          [INCOMPLETE][372] -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-tglu:         [FAIL][374] ([i915#2842]) -> [PASS][375] +1 other test pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][376] ([i915#9820]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy@gt0:
    - shard-mtlp:         [INCOMPLETE][378] -> [PASS][379] +1 other test pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html

  * igt@i915_selftest@live:
    - shard-dg2:          [ABORT][380] ([i915#12133]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - shard-dg2:          [ABORT][382] ([i915#12305]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live@active.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][384] ([i915#12304]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live@workarounds.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][386] ([i915#5138]) -> [PASS][387] +3 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          [FAIL][388] ([i915#5138]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-dg2:          [SKIP][390] ([i915#9197]) -> [PASS][391] +16 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128:
    - shard-dg1:          [DMESG-WARN][392] ([i915#4423]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-128x128.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-128x128.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          [SKIP][396] -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_fb_coherency@memset-crc.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-rkl:          [FAIL][398] ([i915#10826]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-2/igt@kms_flip@blocking-wf_vblank.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@kms_flip@blocking-wf_vblank.html
    - shard-snb:          [FAIL][400] ([i915#10826] / [i915#2122]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_flip@blocking-wf_vblank.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-vga1:
    - shard-snb:          [FAIL][402] ([i915#10826]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_flip@blocking-wf_vblank@a-vga1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-vga1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
    - shard-dg2:          [FAIL][404] ([i915#2122]) -> [PASS][405] +6 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [FAIL][406] ([i915#2122]) -> [PASS][407] +5 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][408] ([i915#2122]) -> [PASS][409] +1 other test pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-rkl:          [FAIL][410] ([i915#2122]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
    - shard-dg1:          [FAIL][412] ([i915#2122]) -> [PASS][413] +3 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:
    - shard-rkl:          [FAIL][414] ([i915#11989]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
    - shard-mtlp:         [FAIL][416] ([i915#2122]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][418] ([i915#5354]) -> [PASS][419] +5 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [FAIL][420] ([i915#6880]) -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][422] -> [PASS][423] +10 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-dg2:          [SKIP][424] ([i915#3555]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_invalid_mode@bad-vtotal.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [SKIP][426] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-dg2:          [SKIP][428] ([i915#12247]) -> [PASS][429] +5 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - shard-dg2:          [SKIP][430] ([i915#12247] / [i915#8152]) -> [PASS][431] +1 other test pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          [SKIP][432] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2:          [FAIL][434] ([i915#7330]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_pm_dc@dc9-dpms.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][436] ([i915#9519]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][438] ([i915#9519]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [SKIP][440] ([i915#11521]) -> [PASS][4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/index.html

--===============0581831991191322599==
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
<tr><td><b>Series:</b></td><td>Add test for fault injection (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139059/">https://patchwork.freedesktop.org/series/139059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15461_full -&gt; IGTPW_11840_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11840_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11840_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11840_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@gem_eio@reset-stress.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@gem_exec_gttfill@engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@gem_exec_gttfill@engines.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-19/igt@gem_mmap_offset@clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@gem_mmap_offset@clear.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-4/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a></li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@perf@blocking.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_joiner@invalid-modeset-force-ultra-joiner:<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_joiner@invalid-modeset-ultra-joiner:<ul>
<li>{shard-tglu-1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15461_full and IGTPW_11840_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_lease@lease-again@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11840_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@drm_fdinfo@busy-idle@vecs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> ([i915#1099]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-18/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> ([i915#4525]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> ([i915#6117])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-13/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_exec_endless@dispatch@bcs0.html">TIMEOUT</a> ([i915#3778]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-7/igt@gem_exec_fair@basic-pace-share.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@gem_exec_gttfill@engines@rcs0.html">INCOMPLETE</a> ([i915#11895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy-odd.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#4077]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527] / [i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887])</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> ([i915#11681])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> ([i915#11681])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_addfb_basic@unused-handle.html">DMESG-WARN</a> ([i915#4423]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">SKIP</a> ([i915#9197]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#9197]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190] / [i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +159 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> ([i915#11616] / [i915#7213]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_chamelium_color@degamma.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2065] / [i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#10826]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-5/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-1/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> ([i915#5354]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#3023]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#1825]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-3/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@kms_plane@plane-panning-bottom-right.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html">SKIP</a> ([i915#12247]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> ([i915#12247]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> ([i915#12247]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#10139])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> ([i915#9688]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb5/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> +100 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> ([i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> ([i915#1072] / [i915#9732]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([i915#11131]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> ([i915#9196]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-5/igt@perf_pmu@busy-idle@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@perf_pmu@busy-idle@vcs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806]) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-19/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781]) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-7/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781]) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb2/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-5/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-1/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@fbdev@pan.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-17/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-7/igt@gem_exec_fair@basic-pace-share.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-8/igt@i915_pm_rc6_residency@rc6-accuracy@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live.html">ABORT</a> ([i915#12133]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live@active.html">ABORT</a> ([i915#12305]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live@active.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-4/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#12304]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-5/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-256x256.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-128x128.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-128x128.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_fb_coherency@memset-crc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-11/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> ([i915#10826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> ([i915#10826] / [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb2/igt@kms_flip@blocking-wf_vblank@a-vga1.html">FAIL</a> ([i915#10826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-1/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-tglu-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-tglu-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg1-15/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#11989]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_invalid_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-2/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> ([i915#7330]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-10/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15461/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11840/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          [SKIP][440] ([i915#11521]) -&gt; [PASS][4</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0581831991191322599==--
