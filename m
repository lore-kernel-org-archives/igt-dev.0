Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE37C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 15:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D410E234;
	Mon, 17 Feb 2025 15:26:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A0710E170;
 Mon, 17 Feb 2025 15:26:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1907259809105685700=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fdraw?=
 =?utf-8?q?=5Fcrc=3A_Add_more_logs_to_skips/failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Feb 2025 15:26:16 -0000
Message-ID: <173980597672.3291137.12916657105596612732@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217083432.771635-1-pranay.samala@intel.com>
In-Reply-To: <20250217083432.771635-1-pranay.samala@intel.com>
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

--===============1907259809105685700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_draw_crc: Add more logs to skips/failure (rev2)
URL   : https://patchwork.freedesktop.org/series/144783/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8233_full -> IGTPW_12613_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12613_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12613_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/index.html

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): shard-snb-0 shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12613_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs1:
    - shard-mtlp:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [FAIL][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  
New tests
---------

  New tests have been introduced between IGT_8233_full and IGTPW_12613_full:

### New IGT tests (2) ###

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.60] s

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  

Known issues
------------

  Here are the changes found in IGTPW_12613_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2-9:        NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-idle@vcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][16] ([i915#8414]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@drm_fdinfo@busy-idle@vcs0.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#13008])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][26] -> [INCOMPLETE][27] ([i915#13356])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2-9:        NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-dg2:          NOTRUN -> [FAIL][29] ([i915#13665])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-reset@vecs0:
    - shard-mtlp:         [PASS][32] -> [ABORT][33] ([i915#13193]) +5 other tests abort
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-5/igt@gem_ctx_isolation@preservation-reset@vecs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@gem_ctx_isolation@preservation-reset@vecs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][34] ([i915#12353]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb6/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#8555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#280]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#280]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [PASS][44] -> [FAIL][45] ([i915#12714] / [i915#5784])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@gem_eio@unwedge-stress.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          [PASS][46] -> [FAIL][47] ([i915#12714] / [i915#5784])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4771])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2-9:        NOTRUN -> [SKIP][50] ([i915#8555])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4525]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@sliced:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#6344])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][54] ([i915#11965]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2-9:        NOTRUN -> [INCOMPLETE][55] ([i915#3778] / [i915#7016]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4812]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3281]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3281]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#3281]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3281]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3281]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg1:          NOTRUN -> [ABORT][64] ([i915#7975]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4860]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@gem_fence_thrash@bo-copy.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][66] ([i915#12964]) +8 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4860]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4860]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#2190])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#284])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4077]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4077]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][77] ([i915#4077]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][78] ([i915#4083]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4083]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@read:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4083]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4083])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2-9:        NOTRUN -> [SKIP][82] ([i915#3282]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3282]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_pwrite@basic-random.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3282])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_pwrite@basic-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#3282]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4270]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2-9:        NOTRUN -> [SKIP][87] ([i915#4270])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [PASS][88] -> [TIMEOUT][89] ([i915#12964]) +1 other test timeout
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          [PASS][90] -> [TIMEOUT][91] ([i915#12917] / [i915#12964])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12917] / [i915#12964])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4270])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190] / [i915#8428]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#8428]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2-9:        NOTRUN -> [SKIP][97] ([i915#4079])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4079]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3282]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4079])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4879])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_unfence_active_buffers.html
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4879])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_unfence_active_buffers.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4879])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][106] ([i915#3323])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#3297] / [i915#3323])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][109] ([i915#3297] / [i915#4880]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3297])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][114] ([i915#13356])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_mixed_blits:
    - shard-dg2-9:        NOTRUN -> [SKIP][115] +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#2527] / [i915#2856])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][117] +125 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-large:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#2856]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#2856]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gen9_exec_parse@bb-start-far.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#2527]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#2527])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#2527] / [i915#2856]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2-9:        NOTRUN -> [SKIP][123] ([i915#2856])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][124] -> [ABORT][125] ([i915#9820])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [PASS][126] -> [ABORT][127] ([i915#9820])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#6412])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#7178])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6412])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#6412])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#8399])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2-9:        NOTRUN -> [SKIP][133] ([i915#11681] / [i915#6621])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#11681])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#8437])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#6245])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5723])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2-9:        NOTRUN -> [DMESG-WARN][138] ([i915#9311]) +1 other test dmesg-warn
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [PASS][139] -> [DMESG-FAIL][140] ([i915#12964]) +1 other test dmesg-fail
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-3/igt@i915_suspend@forcewake.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#7707])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#7707])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4212])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][144] ([i915#12761]) +1 other test incomplete
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#8709]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#8709]) +7 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#8709]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8709]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#12967])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#9531])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][151] -> [FAIL][152] ([i915#11808]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#5286]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#5286]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#5286]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][156] +11 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][157] +16 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3638]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3638])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5190]) +12 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6187]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#5190]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][163] ([i915#4538] / [i915#5190]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4538])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][165] +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#10307] / [i915#10434] / [i915#6095])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#12313]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#12313])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#12313])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#12313])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6095]) +69 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][173] ([i915#10307] / [i915#6095]) +39 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#6095]) +29 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6095]) +54 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#10307] / [i915#6095]) +166 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#12805])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][178] ([i915#12796]) +1 other test incomplete
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#6095]) +12 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#6095]) +71 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#6095]) +128 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#11151] / [i915#7828]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#11151] / [i915#7828]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][185] ([i915#11151] / [i915#7828]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +5 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#3555] / [i915#9979])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][190] ([i915#7173]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][191] ([i915#3299])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3116] / [i915#3299])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3299])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#6944] / [i915#7116] / [i915#7118])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#7118] / [i915#9424])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-9:        NOTRUN -> [SKIP][196] ([i915#13049])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][197] ([i915#13566]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][198] -> [FAIL][199] ([i915#13566])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8814]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][201] ([i915#13566]) +1 other test fail
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [FAIL][202] ([i915#13566]) +1 other test fail
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#13049]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#13049])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#13049])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#13049])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#13049])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][208] -> [FAIL][209] ([i915#13566]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3555]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#3555]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12358] / [i915#7882])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][213] ([i915#12358])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#4103])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#9809]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-9:        NOTRUN -> [SKIP][216] ([i915#13046] / [i915#5354])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#13046] / [i915#5354]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#4103])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-rkl:          [PASS][219] -> [DMESG-WARN][220] ([i915#12964]) +33 other tests dmesg-warn
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-3/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#9723])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][222] ([i915#13694])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#9723])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#8588])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#3555] / [i915#3804])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#3555])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#1769] / [i915#3555] / [i915#3804])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#3804])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3804])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#8812]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][231] ([i915#3840] / [i915#9053])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3637]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][233] -> [FAIL][234] ([i915#11989]) +1 other test fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#3637]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#9934])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8381]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8381])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#8381])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#3637])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#9934]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-9:        NOTRUN -> [SKIP][242] ([i915#9934]) +8 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#9934]) +4 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12745] / [i915#4839])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][245] ([i915#12745])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          [PASS][246] -> [FAIL][247] ([i915#11989])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-5/igt@kms_flip@plain-flip-fb-recreate.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][248] -> [FAIL][249] ([i915#11989]) +5 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-tglu-9/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
    - shard-mtlp:         [PASS][250] -> [FAIL][251] ([i915#11989]) +1 other test fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@b-dp4:
    - shard-dg2:          NOTRUN -> [FAIL][252] ([i915#11989]) +2 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate@b-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-rkl:          [PASS][253] -> [FAIL][254] ([i915#11989])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-6/igt@kms_flip@plain-flip-ts-check.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][255] ([i915#11989])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555] / [i915#5190])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#2672]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672] / [i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#2587] / [i915#2672]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8810] / [i915#8813])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#8810])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#2672]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#2587] / [i915#2672])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#2587] / [i915#2672])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][271] ([i915#2672] / [i915#3555]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][272] ([i915#2672]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-rkl:          [PASS][273] -> [DMESG-WARN][274] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-1/igt@kms_flip_tiling@flip-change-tiling.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#8708]) +21 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-snb:          [PASS][276] -> [SKIP][277] +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#1825]) +19 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-9:        NOTRUN -> [SKIP][279] ([i915#5354]) +12 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][280] -> [FAIL][281] ([i915#6880]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-9:        NOTRUN -> [FAIL][282] ([i915#6880])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#10055])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3458]) +16 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#3458]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#3458]) +8 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][287] +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][288] ([i915#8708]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#8708]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#5354]) +25 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] +32 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-9:        NOTRUN -> [SKIP][292] ([i915#9766])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#3023]) +11 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#1825]) +25 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#8708]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][296] +70 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#6118])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8228]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#12713])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#12713])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#12713])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#12713])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#1187] / [i915#12713])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][304] -> [SKIP][305] ([i915#3555] / [i915#8228])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@kms_hdr@static-swap.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#3555] / [i915#8228])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#10656])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#12388])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#12388])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#12339])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#12394])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#10656])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#13522])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_lease@lease-again:
    - shard-dg1:          [PASS][316] -> [DMESG-WARN][317] ([i915#4423])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg1-15/igt@kms_lease@lease-again.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_lease@lease-again.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#6301])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][319] ([i915#12756] / [i915#13409] / [i915#13476])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][320] ([i915#12756])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][321] ([i915#13026]) +1 other test incomplete
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][322] ([i915#12178])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][323] ([i915#7862]) +1 other test fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][324] ([i915#10647] / [i915#12169]) +1 other test fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][325] ([i915#10647]) +3 other tests fail
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#3555] / [i915#8806])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#3555]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-9:        NOTRUN -> [SKIP][328] ([i915#3555] / [i915#8806])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12247] / [i915#9423])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#12247]) +8 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12247] / [i915#6953] / [i915#9423])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#12247] / [i915#6953]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#12247] / [i915#6953])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#12247] / [i915#6953])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#12247] / [i915#6953])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#12247]) +7 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#12247]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#12247]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#12247]) +18 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#12247]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#12247] / [i915#3555])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#12247] / [i915#3555])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9812])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12343])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#9292])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#9685])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#3828])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#5978])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#3361])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#3361])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu:         NOTRUN -> [FAIL][351] ([i915#9295])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
    - shard-mtlp:         NOTRUN -> [FAIL][352] ([i915#12913])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#4281])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#4077]) +9 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][355] -> [SKIP][356] ([i915#9519])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#9519])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#9519])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#9519])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#9519])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][361] -> [SKIP][362] ([i915#9519]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#9519]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#11520]) +4 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][365] ([i915#11520]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#11520]) +3 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#9808]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#12316]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][369] ([i915#11520]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#11520]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#11520]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][372] ([i915#11520]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][373] ([i915#11520]) +12 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#4348]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#9683]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#9683]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#9683]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg2-9:        NOTRUN -> [SKIP][378] ([i915#9683])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#9683])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#1072] / [i915#9732]) +20 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-plane-move.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#1072] / [i915#9732]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][382] +483 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#9732]) +14 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#9688]) +15 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][385] ([i915#1072] / [i915#9732]) +9 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#1072] / [i915#9732]) +9 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#9732]) +9 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#4077] / [i915#9688]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#9685])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#9685])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-9:        NOTRUN -> [SKIP][391] ([i915#5190])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][392] ([i915#5289])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#12755]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#12755])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu:         NOTRUN -> [SKIP][395] ([i915#3555])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][396] ([i915#13179]) +1 other test abort
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#8623])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][398] ([i915#12276]) +1 other test incomplete
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#9906]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-9:        NOTRUN -> [SKIP][400] ([i915#3555]) +3 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#9906]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][402] ([i915#3555] / [i915#9906])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#2437])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#2437]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#2437])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html
    - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#2437])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#2437])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][408] ([i915#2437])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#2437] / [i915#9412])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2-9:        NOTRUN -> [SKIP][410] ([i915#2436])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][411] ([i915#7387])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][412] -> [FAIL][413] ([i915#4349]) +4 other tests fail
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@invalid-init:
    - shard-glk:          NOTRUN -> [FAIL][414] ([i915#13663])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk6/igt@perf_pmu@invalid-init.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#8516])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#8516])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][417] ([i915#8516])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#8516])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#3708] / [i915#4077]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#3291] / [i915#3708])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][421] ([i915#3708] / [i915#4077]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#3708]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#3708] / [i915#4077])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#3708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#3708])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#3708])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][427] ([i915#12910]) +9 other tests fail
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2-9:        NOTRUN -> [SKIP][428] ([i915#4818])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-mtlp:         [DMESG-WARN][429] -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-7/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_eio@in-flight-immediate:
    - shard-mtlp:         [ABORT][431] ([i915#13193]) -> [PASS][432] +2 other tests pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-7/igt@gem_eio@in-flight-immediate.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-8/igt@gem_eio@in-flight-immediate.html

  * igt@gem_exec_schedule@fairslice:
    - shard-rkl:          [DMESG-WARN][433] ([i915#12964]) -> [PASS][434] +32 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-5/igt@gem_exec_schedule@fairslice.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_exec_schedule@fairslice.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][435] ([i915#11441] / [i915#13304]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][437] ([i915#11441]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [TIMEOUT][439] ([i915#12917] / [i915#12964]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [DMESG-FAIL][441] ([i915#12964]) -> [PASS][442] +1 other test pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-1/igt@gem_softpin@noreloc-s3.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][443] ([i915#5566]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [DMESG-WARN][462], [PASS][463], [PASS][464], [PASS][465], [PASS][466], [PASS][467]) ([i915#13368]) -> ([PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-11/igt@i915_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-7/igt@i915_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-2/igt@i915_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-8/igt@i915_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-2/igt@i915_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-1/igt@i915_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-3/igt@i915_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-11/igt@i915_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-11/igt@i915_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-5/igt@i915_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-3/igt@i915_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-7/igt@i915_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-6/igt@i915_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-2/igt@i915_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-3/igt@i915_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-6/igt@i915_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-5/igt@i915_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@i915_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@i915_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@i915_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@i915_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@i915_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@i915_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@i915_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@i915_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@i915_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@i915_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@i915_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@i915_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@i915_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@i915_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@i915_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@i915_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@i915_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@i915_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-8/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][491] ([i915#9820]) -> [PASS][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][493] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][494]
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][495] ([i915#4817]) -> [PASS][496]
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][497] ([i915#5138]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-b-hdmi-a-1:
    - shard-snb:          [INCOMPLETE][499] -> [PASS][500] +1 other test pass
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-b-hdmi-a-1.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][501] ([i915#13566]) -> [PASS][502] +1 other test pass
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][503] ([i915#13566]) -> [PASS][504]
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:
    - shard-tglu:         [FAIL][505] ([i915#11989]) -> [PASS][506] +2 other tests pass
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-tglu-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
    - shard-snb:          [FAIL][507] ([i915#11989]) -> [PASS][508] +9 other tests pass
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [FAIL][509] ([i915#6880]) -> [PASS][510]
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [SKIP][511] -> [PASS][512] +2 other tests pass
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][513] ([i915#3555] / [i915#8228]) -> [PASS][514]
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][515] ([i915#9519]) -> [PASS][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][517] ([i915#9196]) -> [PASS][518] +1 other test pass
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [DMESG-WARN][519] ([i915#12917] / [i915#12964]) -> [PASS][520]
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-7/igt@kms_vblank@query-forked-hang.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][521] ([i915#3555] / [i915#9906]) -> [PASS][522]
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-1/igt@kms_vrr@negative-basic.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@busy-idle:
    - shard-mtlp:         [FAIL][523] ([i915#4349]) -> [PASS][524] +1 other test pass
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-mtlp-4/igt@perf_pmu@busy-idle.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@perf_pmu@busy-idle.html

  
#### Warnings ####

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [SKIP][525] ([i915#4270]) -> [TIMEOUT][526] ([i915#12917] / [i915#12964])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-1/igt@gem_pxp@display-protected-crc.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@gem_pxp@display-protected-crc.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][527] ([i915#11703] / [i915#13592] / [i915#9820]) -> [ABORT][528] ([i915#9820])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@mock:
    - shard-glk:          [DMESG-WARN][529] ([i915#9311]) -> [DMESG-WARN][530] ([i915#1982] / [i915#9311])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-glk7/igt@i915_selftest@mock.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-glk1/igt@i915_selftest@mock.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [SKIP][531] ([i915#7118] / [i915#9424]) -> [FAIL][532] ([i915#7173])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [FAIL][533] ([i915#7173]) -> [SKIP][534] ([i915#7118] / [i915#9424]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@kms_content_protection@legacy.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          [SKIP][535] ([i915#7118]) -> [FAIL][536] ([i915#7173])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-3/igt@kms_content_protection@srm.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][537] -> [SKIP][538] ([i915#4423]) +1 other test skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][539] ([i915#10433] / [i915#3458]) -> [SKIP][540] ([i915#3458]) +3 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg1:          [SKIP][541] ([i915#3458]) -> [SKIP][542] ([i915#3458] / [i915#4423])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][543] ([i915#4281]) -> [SKIP][544] ([i915#3361])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [ABORT][545] -> [SKIP][546] ([i915#6524])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12913]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12913
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193
  [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13368]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13368
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13592
  [i915#13663]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663
  [i915#13665]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13665
  [i915#13694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13694
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
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
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
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
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8233 -> IGTPW_12613

  CI-20190529: 20190529
  CI_DRM_16143: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12613: 12613
  IGT_8233: 2ccc769a09071702a620a6e9deb0c50120c62ebb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/index.html

--===============1907259809105685700==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_draw_crc: Add more logs to s=
kips/failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144783/">https://patchwork.freedesktop.org/series/144783/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12613/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8233_full -&gt; IGTPW_12613_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12613_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12613_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/index=
.html</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): shard-snb-0 shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1261=
3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk4/igt@gem_softpin@noreloc-s3.html">INCOM=
PLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1261=
3/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">ABORT</a><=
/li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1261=
3/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html">DMESG-WARN=
</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_pxp@hw-rejects-pxp-buffer:<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl=
-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8233_full and IGTPW_12613_ful=
l:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12613_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@drm_fdinfo@all-busy-check-all.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8414">i915#8414</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@drm_fdinfo@busy-idle@vcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8414">i915#8414</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/841=
4">i915#8414</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0=
-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12613/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compres=
sed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_compute@compute-square.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13665">i915#13665</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-5/igt@gem_ctx_isolation@preservation-reset@vecs0.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2613/shard-mtlp-7/igt@gem_ctx_isolation@preservation-reset@vecs0.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3193">i915#13193</a>) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk3/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12353">i915#12353</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-snb6/igt@gem_ctx_persistence@engines-hang.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@gem_ctx_persistence@hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-st=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-10/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt=
@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12714">i915#12714</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg1-13/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-19/ig=
t@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12714">i915#12714</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@gem_exec_balancer@parallel.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_exec_balancer@sliced.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_endless@dispatch.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3778">i915#3778</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7016">i915#7016</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_exec_fence@submit67.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_exec_flush@basic-uc-ro-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-noreloc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_exec_reloc@basic-wc-noreloc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-=
active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@gem_exec_reloc@basic-write-wc-ac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@gem_exec_suspend@basic-s4-device=
s.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@gem_fence_thrash@bo-copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4860">i915#4860</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_fence_thrash@bo-copy.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12964">i915#12964</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-ra=
ndom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-=
random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_mmap_gtt@basic-small-copy-xy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_mmap_wc@bad-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_mmap_wc@copy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_mmap_wc@read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_mmap_wc@read-write-distinct.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_partial_pwrite_pread@write-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_pwrite@basic-random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
282">i915#3282</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_pwrite@basic-random.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@gem_pwrite@basic-random.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_pxp@protected-raw-src-copy-no=
t-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
613/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12613/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-3.html=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@gem_pxp@verify-pxp-stale-buf-opt=
out-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-yf=
-tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@gem_render_copy@y-tiled-mc-ccs-t=
o-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_render_tiled_blits@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@gem_unfence_active_buffers.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4879">i915#4879</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@gem_unfence_active_buffers.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4879">i915#4879</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@gem_unfence_active_buffers.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk1/igt@gem_workarounds@suspend-resume-fd.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gen3_mixed_blits.html">SKIP</a> +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@gen9_exec_parse@allowed-single.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@gen9_exec_parse@bb-start-far.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2856">i915#2856</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@gen9_exec_parse@bb-start-far.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@gen9_exec_parse@bb-start-far.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@gen9_exec_parse@unaligned-access.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2613/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
820">i915#9820</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12613/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@i915_pm_rps@thresholds.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@i915_query@test-query-geometry-su=
bslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@i915_selftest@mock@memory_region.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@=
i915_suspend@forcewake.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test d=
mesg-fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk3/igt@kms_async_flips@async-flip-suspend=
-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-=
a-3-y-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-=
a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-r=
c-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_async_flips@invalid-async-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12967">i915#12967</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transiti=
on@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> +16 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6187">i915#6187</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tile=
d-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +71 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +128 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-with-ena=
bled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests s=
kip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_content_protection@dp-mst-lic=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a=
-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-random-256=
x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi=
-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-=
a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flip=
b-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-3/igt@kms_cursor_legacy@single-bo@all-pipes.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/s=
hard-rkl-1/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i=
915#12964</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vg=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13694">i915#13694</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_display_modes@mst-extended-m=
ode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-3/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdm=
i-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga=
1-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11989">i915#11989</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-15/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8381">i915#8381</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip@2x-flip-vs-rmfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-5/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-d=
g2-10/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-tglu-9/igt@kms_flip@plain-flip-fb-recreate-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12613/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11989">i915#11989</a>) +5 other tests fail</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12613/shard-mtlp-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11989">i915#11989</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-dp4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate@=
b-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11989">i915#11989</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-6/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-=
2/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11989">i915#11989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_flip@plain-flip-ts-check@a-hd=
mi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11989">i915#11989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i=
915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-1/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shar=
d-rkl-3/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12=
917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12964">i915#12964</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +21 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12613/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cu=
r-indfb-onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +19 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12613/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cp=
u.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6880">i915#6880</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-pri-indfb-multidraw.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +25 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +25 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shr=
fb-scaledprimary.html">SKIP</a> +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_getfb@getfb-reject-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12713">i915#12713</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12713">i915#12713</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1187">i915#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@km=
s_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-19/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12388">i915#12388</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12394">i915#12394</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-again:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg1-15/igt@kms_lease@lease-again.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt=
@kms_lease@lease-again.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-cr=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk6/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque=
-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12169">i915#12169</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7=
 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +1=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9292">i915#9292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978">=
i915#5978</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">=
i915#3361</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361"=
>i915#3361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295"=
>i915#9295</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12913=
">i915#12913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281"=
>i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_pm_rpm@cursor-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@km=
s_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519=
">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
613/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519=
">i915#9519</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-snb2/igt@kms_psr2_sf@fbc-pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4348">i915#4348</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +483 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-6/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9688">i915#9688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-1/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-1/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-9/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-2/igt@kms_rotation_crc@sprite-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-=
90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk2/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-2/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-4/igt@kms_writeback@writeback-check-out=
put.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-7/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk7/igt@kms_writeback@writeback-invalid-pa=
rameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@kms_writeback@writeback-pixel-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@perf@global-sseu-config.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard=
-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-init:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-glk6/igt@perf_pmu@invalid-init.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1366=
3">i915#13663</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@prime_vgem@basic-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-14/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@sriov_basic@bind-unbind-vf@vf-5.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-9/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-7/igt@gem_ctx_persistence@legacy-engines-mixed-process=
@vebox.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12613/shard-mtlp-4/igt@gem_ctx_persistence@legacy-engines-=
mixed-process@vebox.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-7/igt@gem_eio@in-flight-immediate.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193">i915=
#13193</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12613/shard-mtlp-8/igt@gem_eio@in-flight-immediate.html">PASS</a> +2 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-5/igt@gem_exec_schedule@fairslice.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">=
i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12613/shard-rkl-8/igt@gem_exec_schedule@fairslice.html">PASS</a> +32 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441">i9=
15#11441</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13304">i915#13304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/114=
41">i915#11441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@gem_pxp@reject-m=
odify-context-protection-off-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-1/igt@gem_softpin@noreloc-s3.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#=
12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12613/shard-rkl-7/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-glk7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915=
#5566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12613/shard-glk2/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8233/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-7/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_8233/shard-dg2-2/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_8233/shard-dg2-8/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-2=
/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGT_8233/shard-dg2-1/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-=
dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/s=
hard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-4/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
8233/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-5/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8233/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-7/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-6/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8233/shard-dg2-2/igt@i915_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-d=
g2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8233/s=
hard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGT_8233/shard-dg2-10/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
8233/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13368">i915#13368</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shar=
d-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12613/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-10/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12613/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2=
-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-11/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
613/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12613/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-2/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12613/shard-dg2-3/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-=
dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2613/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12613/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12613/shard-dg2-6/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard=
-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-7/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12613/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-8/igt@i915_modul=
e_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9820">i915#9820</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12613/shard-dg1-19/igt@i915_module_load@reload-with-fault-i=
njection.html">PASS</a></li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10131">i915#10131</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10887">i915#10887</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-7/igt@i915=
_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12613/shard-glk7/igt@i915_suspend@fence-restore-tiled2untile=
d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12613/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-b-hdm=
i-a-1.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12613/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-128x12=
8@pipe-b-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi=
-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_12613/shard-tglu-5/igt@kms_cursor_crc@cursor-onscr=
een-64x21@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a=
-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_12613/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-=
64x21@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-tglu-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11989">i915#11989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12613/shard-tglu-4/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hd=
mi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11989">i915#11989</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12613/shard-snb2/igt@kms_flip@plain-flip-fb-recre=
ate-interruptible@b-hdmi-a1.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pl=
flip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-5/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-indfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-pwrite.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12613/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-spr-indfb-draw-pwrite.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12613/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#95=
19</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_126=
13/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9196">i915#9196</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12613/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak=
@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-7/igt@kms_vblank@query-forked-hang.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917"=
>i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12613/shard-rkl-3/igt@kms_vblank@query-forked-hang.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906=
">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12613/shard-dg2-11/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-mtlp-4/igt@perf_pmu@busy-idle.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard=
-mtlp-7/igt@perf_pmu@busy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-1/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#=
4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2613/shard-rkl-7/igt@gem_pxp@display-protected-crc.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#1=
2917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11703">i915#11703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13592">i915#13592</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-snb5/igt@i915_mod=
ule_load@reload-with-fault-injection.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-glk7/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613=
/shard-glk1/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9=
311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">=
i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12613/shard-dg2-10/igt@kms_content_protection@atomic-dpms=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915=
#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12613/shard-dg2-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-3/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#711=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1261=
3/shard-dg2-11/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12613/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-dg2-1/igt@kms_frontbuf=
fer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12613/shard-dg1-12/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-=
rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8233/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html">ABORT</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12613/shard-rkl-4=
/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8233 -&gt; IGTPW_12613</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16143: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_12613: 12613<br />
  IGT_8233: 2ccc769a09071702a620a6e9deb0c50120c62ebb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1907259809105685700==--
