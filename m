Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE2C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 05:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F9710E103;
	Mon,  1 Jul 2024 05:14:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A0910E103;
 Mon,  1 Jul 2024 05:14:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0134933954576655723=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50ZWwgWGUgT0EgSUdUJ3MgKHJl?=
 =?utf-8?b?djYp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Jul 2024 05:14:53 -0000
Message-ID: <171981089399.1690.17671553863397469414@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
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

--===============0134933954576655723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev6)
URL   : https://patchwork.freedesktop.org/series/130033/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7908_full -> IGTPW_11342_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11342_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11342_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11342_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  
#### Warnings ####

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          [SKIP][4] ([i915#4235]) -> [SKIP][5] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@kms_rotation_crc@bad-pixel-format.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_rotation_crc@bad-pixel-format.html

  
New tests
---------

  New tests have been introduced between IGT_7908_full and IGTPW_11342_full:

### New IGT tests (14) ###

  * igt@gem_create@create-ext-cpu-access-big:
    - Statuses : 1 abort(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.00, 0.04] s

  * igt@gem_exec_capture@capture-recoverable:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@i915_query@query-regions-unallocated:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_color@ctm-signed@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_color@ctm-signed@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_11342_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414]) +11 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +15 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +28 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][11] ([i915#7742])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8562])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#8562])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb4/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8555]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][25] -> [FAIL][26] ([i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#4812]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4771])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4036])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#6334]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#6334])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6344])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_exec_fair@basic-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4473] / [i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][38] ([i915#2842]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][39] ([i915#2842]) +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][40] -> [FAIL][41] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][43] ([i915#2842])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +13 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3281]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +9 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#2190])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-9/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-multi@lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][55] ([i915#10378]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_lmem_swapping@heavy-multi@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg2:          [PASS][56] -> [FAIL][57] ([i915#10378])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html

  * igt@gem_lmem_swapping@parallel-random@lmem0:
    - shard-dg1:          [PASS][58] -> [DMESG-WARN][59] ([i915#1982] / [i915#4423])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-15/igt@gem_lmem_swapping@parallel-random@lmem0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_lmem_swapping@parallel-random@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][61] -> [TIMEOUT][62] ([i915#5493])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4565]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#8289])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_mmap_wc@fault-concurrent.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk3/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3282])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4270]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282] / [i915#4423])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190] / [i915#8428]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#8411]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +14 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +15 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#3323])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#4880]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4958])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@gem_userptr_blits@unsync-overlap.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][95] +29 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#2527]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#2856])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gen9_exec_parse@secure-batches.html
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4881])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@i915_fb_tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4881])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [PASS][103] -> [ABORT][104] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][105] ([i915#10131] / [i915#10887] / [i915#9820])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6621])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#6621])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#8925])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#8925])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#8437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#6188])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@mock@memory_region:
    - shard-glk:          NOTRUN -> [DMESG-WARN][112] ([i915#9311])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk7/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4212]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4215] / [i915#5190])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4212]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#8709]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#8709]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#8709]) +11 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#1769] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#5286]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#5286])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5286]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][126] -> [DMESG-FAIL][127] ([i915#2017])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3638]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4538] / [i915#5190]) +14 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][131] +19 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][132] +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#10656]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_big_joiner@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#10656]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#10656])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#6095]) +131 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#6095]) +163 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#6095]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +65 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#7213]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#7828]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#7828]) +10 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#7828]) +12 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#7828]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7116] / [i915#9424]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3299])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3116])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6944] / [i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_content_protection@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7118] / [i915#9424]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3359])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3555]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3555]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3555]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#9809]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#4103])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][161] -> [FAIL][162] ([i915#2346])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#9067])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9723])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#8588])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3804])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#1257])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#8812])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8812])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#8812])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3555] / [i915#3840]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3955])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#1839])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#1839]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#1839])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#658])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#8381])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#8381])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9934]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3637]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#2587] / [i915#2672])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#2672]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#2587] / [i915#2672]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#2672]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#2672] / [i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#5354]) +45 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#10433] / [i915#3458])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#1825]) +37 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8708]) +20 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][191] +60 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#1825]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9766])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9766])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#8708]) +14 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3023]) +26 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3458]) +20 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][198] +34 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3458]) +15 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8708]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#6118])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8228]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8228]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#6301]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][207] +26 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8821])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8821])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#5354] / [i915#9423])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#6953] / [i915#9423])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#6953])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#9423]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#9423]) +15 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#9423]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#5176]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#5176] / [i915#9423]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#5235]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5235] / [i915#9423]) +23 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#5235]) +11 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#5354]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#9685]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#9685]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#9685])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8430])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9519]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][227] -> [SKIP][228] ([i915#9519])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][229] -> [SKIP][230] ([i915#9519]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9519]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#6524])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#6524])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#11520]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#11520]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#11520])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#11520]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#9683]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#9683])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#9732]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_psr@fbc-psr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#1072] / [i915#9732]) +21 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#9688]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#1072] / [i915#9732]) +22 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#1072] / [i915#9732]) +27 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#1072] / [i915#9673] / [i915#9732])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][246] +223 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5190]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#4235] / [i915#5190])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#5289])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#4235])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3555]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#8623])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#8623])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][254] -> [FAIL][255] ([i915#9196])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
    - shard-dg1:          [PASS][256] -> [FAIL][257] ([i915#9196])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#9906]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#9906])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#9906])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#9906])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#2437])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#2437])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#2437])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#2436])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#2434])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#2433])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8807])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8516])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#8516])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][271] ([i915#9351])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#3708]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#3291] / [i915#3708])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3291] / [i915#3708]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#9917])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#9917])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#9917])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#9917])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][279] ([i915#9781])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][280] ([i915#9781])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#4818])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][282] ([i915#6268]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [FAIL][284] ([i915#2842]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][286] ([i915#2842]) -> [PASS][287] +2 other tests pass
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [ABORT][288] -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-snb4/igt@i915_selftest@live@sanitycheck.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb4/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_cursor_legacy@single-bo@pipe-a:
    - shard-rkl:          [DMESG-WARN][290] ([i915#10166]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@kms_cursor_legacy@single-bo@pipe-a.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_cursor_legacy@single-bo@pipe-a.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][292] ([i915#9295]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][294] ([i915#4281]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [FAIL][296] ([i915#8717]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][298] ([i915#9519]) -> [PASS][299] +2 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-mtlp:         [INCOMPLETE][300] ([i915#9853]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-mtlp-3/igt@perf_pmu@rc6@other-idle-gt0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@perf_pmu@rc6@other-idle-gt0.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][302] ([i915#9820]) -> [ABORT][303] ([i915#9697])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [FAIL][304] ([i915#10031] / [i915#11279]) -> [INCOMPLETE][305] ([i915#4817])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          [SKIP][306] ([i915#4538] / [i915#5286]) -> [SKIP][307] ([i915#4423] / [i915#4538] / [i915#5286])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][308] ([i915#8708]) -> [SKIP][309] ([i915#4423] / [i915#8708])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][310] ([i915#3458]) -> [SKIP][311] ([i915#10433] / [i915#3458]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][312] ([i915#10433] / [i915#3458]) -> [SKIP][313] ([i915#3458])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][314] ([i915#3361]) -> [SKIP][315] ([i915#4281])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-dg2:          [SKIP][316] ([i915#1072] / [i915#9732]) -> [SKIP][317] ([i915#1072] / [i915#9673] / [i915#9732]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-5/igt@kms_psr@fbc-psr-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          [SKIP][318] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][319] ([i915#1072] / [i915#9732]) +10 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@kms_psr@psr-cursor-render.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_psr@psr-cursor-render.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][320] ([i915#9100]) -> [FAIL][321] ([i915#7484])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html

  
  [i915#10031]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10031
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11279]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11279
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
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
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6268]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9853]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9853
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7908 -> IGTPW_11342

  CI-20190529: 20190529
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11342: 11342
  IGT_7908: 7908

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/index.html

--===============0134933954576655723==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7908_full -&gt; IGTPW_11342_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11342_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11342_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11342_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_rotation_crc@bad-pixel-format:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7908_full and IGTPW_11342_full:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>Statuses : 1 abort(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-regions-unallocated:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11342_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb4/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-17/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_exec_balancer@hog.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-9/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_lmem_swapping@heavy-multi@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-15/igt@gem_lmem_swapping@parallel-random@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_lmem_swapping@parallel-random@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-xy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@gem_mmap_gtt@basic-small-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@gem_pxp@create-regular-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +163 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-3/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-7/igt@kms_psr@fbc-psr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-1/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> +223 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-15/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-5/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351">i915#9351</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-18/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-14/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-16/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-snb4/igt@i915_selftest@live@sanitycheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-snb4/igt@i915_selftest@live@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@kms_cursor_legacy@single-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166">i915#10166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_cursor_legacy@single-bo@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717">i915#8717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-mtlp-3/igt@perf_pmu@rc6@other-idle-gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9853">i915#9853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-mtlp-2/igt@perf_pmu@rc6@other-idle-gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697">i915#9697</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10031">i915#10031</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11279">i915#11279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-11/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-11/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-10/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7908/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11342/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484">i915#7484</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7908 -&gt; IGTPW_11342</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11342: 11342<br />
  IGT_7908: 7908</p>

</body>
</html>

--===============0134933954576655723==--
