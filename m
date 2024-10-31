Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63624E68978
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 11:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1734510E86F;
	Thu, 31 Oct 2024 11:52:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C337A10E869;
 Thu, 31 Oct 2024 11:52:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9208150100528163871=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_lib/igt=5Fkmod=3A_Drop_PM_i?=
 =?utf-8?q?nteraction_on_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 11:52:01 -0000
Message-ID: <173037552178.1365305.6836064067938919538@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030234838.857880-1-lucas.demarchi@intel.com>
In-Reply-To: <20241030234838.857880-1-lucas.demarchi@intel.com>
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

--===============9208150100528163871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: Drop PM interaction on unbind
URL   : https://patchwork.freedesktop.org/series/140744/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15615_full -> IGTPW_12009_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12009_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12009_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12009_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@engines:
    - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-3/igt@gem_exec_gttfill@engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_exec_gttfill@engines.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb4/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb4/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-mtlp:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_rotation_crc@bad-pixel-format:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html

  
Known issues
------------

  Here are the changes found in IGTPW_12009_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +8 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8414]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_read@short-buffer-block:
    - shard-dg2:          [PASS][16] -> [SKIP][17] ([i915#9197]) +16 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-1/igt@drm_read@short-buffer-block.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@drm_read@short-buffer-block.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3281]) +10 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@close-race:
    - shard-dg1:          NOTRUN -> [FAIL][21] ([i915#12297] / [i915#12577])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_busy@close-race.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][24] -> [INCOMPLETE][25] ([i915#12392] / [i915#7297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         NOTRUN -> [FAIL][30] ([i915#12031])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][36] ([i915#7975] / [i915#8213])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][37] ([i915#8898])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_balancer@bonded-true-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473] / [i915#4771]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [PASS][45] -> [FAIL][46] ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][47] ([i915#2842]) +5 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-rkl:          NOTRUN -> [FAIL][48] ([i915#2842]) +4 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3281]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3281]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3281]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@pi-common@vcs0:
    - shard-rkl:          NOTRUN -> [FAIL][54] ([i915#12296]) +4 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_schedule@pi-common@vcs0.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#7276])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4537] / [i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4860]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4860]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#4613]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4077]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4083]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][73] ([i915#2658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +10 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#4270]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4270]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4270]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#4270]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3282]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8428]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4079]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4879])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3282] / [i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#3297]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4958])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#3297]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#2527])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@load:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#6227])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][103] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][104] ([i915#9820])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#8399])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#8399])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][107] ([i915#2681]) +1 other test warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg1:          [PASS][108] -> [DMESG-WARN][109] ([i915#4423])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#11681] / [i915#6621])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#6245])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#6188])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#7707])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4212] / [i915#5190])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#8709]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8709]) +11 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#6228])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#6228])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#9531])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][126] +16 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#5286]) +8 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5286]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#5286]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3638]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#5190] / [i915#9197]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3638]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5190]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#5190]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][135] +15 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10307] / [i915#6095]) +167 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#12313]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#12313]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +24 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6095]) +39 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#12313]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#12313])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6095]) +24 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +94 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +127 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3742])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4087]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#7828]) +8 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7828]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] +32 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#7828]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828]) +15 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#7828]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#7828]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#12655])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [PASS][159] -> [SKIP][160] ([i915#12655])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-1/igt@kms_color@ctm-negative.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_color@ctm-negative.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3116] / [i915#3299])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3116]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#6944] / [i915#9424]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_content_protection@lic-type-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#6944] / [i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7118])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7118] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8814])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3555]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#11453] / [i915#3359]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#11453] / [i915#3359]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#11453] / [i915#3359]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#11453] / [i915#3359])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#11453] / [i915#3359])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#8814]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#9197]) +10 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#4103]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#9809])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#4103]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#9723])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#1769] / [i915#3555] / [i915#3804])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#3804])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#12402])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#3840])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#1839])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#1839]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#1839])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#658]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3637]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3637]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#3637]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9934]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][196] ([i915#2122]) +3 other tests fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#8381])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][198] ([i915#4423]) +2 other tests dmesg-warn
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][199] -> [INCOMPLETE][200] ([i915#4839] / [i915#6113])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-mtlp:         [PASS][201] -> [INCOMPLETE][202] ([i915#6113]) +1 other test incomplete
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2:          NOTRUN -> [INCOMPLETE][203] ([i915#4839] / [i915#6113])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][204] ([i915#6113])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:
    - shard-dg1:          [PASS][205] -> [INCOMPLETE][206] ([i915#6113])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#2672] / [i915#3555]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#2672] / [i915#8813]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672] / [i915#3555])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#2587] / [i915#2672] / [i915#3555])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2672] / [i915#3555] / [i915#5190])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][214] -> [SKIP][215] ([i915#3555]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#5190])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-snb:          [PASS][224] -> [SKIP][225] +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1825]) +22 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][227] +23 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5354]) +50 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-dg2:          [PASS][229] -> [SKIP][230] ([i915#5354]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#5439])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3023]) +38 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][233] +37 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#8708]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#8708]) +18 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#10433] / [i915#3458])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#8708]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3458]) +16 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][239] +76 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#1825]) +50 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3458]) +13 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#6118])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][243] -> [SKIP][244] ([i915#433])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#433])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@kms_hdmi_inject@inject-audio.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [PASS][247] -> [SKIP][248] ([i915#433])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#433])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8228])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8228])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#10656])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#12388])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#12339])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#7294])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8806])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8806])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#6953])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#6953] / [i915#9423])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][264] ([i915#8292]) +1 other test fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][265] ([i915#8292]) +1 other test fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#8152] / [i915#9423])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3555]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#3555]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#3555]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#12247]) +9 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12247]) +10 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#12247] / [i915#6953])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#8152])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#12247] / [i915#12504] / [i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12247] / [i915#3555])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#12247] / [i915#3555])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#3555] / [i915#9423])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#12247] / [i915#3555])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#12247] / [i915#12504]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#12247]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#12247] / [i915#6953])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#12247]) +12 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-snb:          NOTRUN -> [SKIP][284] +33 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12247]) +15 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12247]) +12 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#8152]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#12343])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12343])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#9812]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#9812])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9685])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#5978])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9685])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#9519])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#9519])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#9519])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#4077]) +13 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#6524] / [i915#6805]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#6524])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#6524])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [PASS][303] -> [SKIP][304] ([i915#11521])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-8/igt@kms_properties@plane-properties-atomic.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12316]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#11520]) +8 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#11520]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#11520]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
    - shard-snb:          NOTRUN -> [SKIP][309] ([i915#11520])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#11520]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#11520]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#9688]) +13 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +26 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#9732]) +6 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@pr-sprite-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9732]) +19 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_psr@pr-sprite-mmap-cpu.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +15 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +30 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#11131] / [i915#4235])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#11131] / [i915#4235] / [i915#5190])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#5289]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#5030] / [i915#9041])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#5030]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#5030] / [i915#9041])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][324] ([i915#12231]) +1 other test abort
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][325] ([i915#12231]) +1 other test abort
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#3555]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8809])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][328] ([IGT#2] / [i915#6493])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#8623])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#3555] / [i915#8808])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#11920])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][332] -> [FAIL][333] ([i915#10393]) +1 other test fail
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-1/igt@kms_vrr@negative-basic.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#9906])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#9906]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#8808] / [i915#9906])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#2437] / [i915#9412])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#2437] / [i915#9412])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#7387])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#2434])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@perf@mi-rpc.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#8850])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#8850])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][343] ([i915#11943] / [i915#12515]) +1 other test fail
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#8516])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#8516])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#8516])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#8516])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#3708] / [i915#4077])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#3291] / [i915#3708])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#3708])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#9917])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#9917]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][353] ([i915#12564] / [i915#9781])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][354] ([i915#9846]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][356] ([i915#11980] / [i915#12580]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-tglu-6/igt@gem_ctx_persistence@hostile.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][358] ([i915#12543] / [i915#5784]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-15/igt@gem_eio@reset-stress.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_mmap_offset@clear:
    - shard-mtlp:         [ABORT][360] ([i915#10729]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-6/igt@gem_mmap_offset@clear.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_mmap_offset@clear.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-mtlp:         [ABORT][362] ([i915#10029] / [i915#10729]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-6/igt@gem_mmap_offset@clear@smem0.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_mmap_offset@clear@smem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][364] ([i915#9820]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][366] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][368] ([i915#3591]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][370] ([i915#11808] / [i915#5956]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          [SKIP][372] ([i915#12655]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_color@ctm-max.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_color@ctm-max.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [SKIP][374] ([i915#1849]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][376] ([i915#2122]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][378] ([i915#5354]) -> [PASS][379] +7 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [FAIL][380] ([i915#6880]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][382] ([i915#3555] / [i915#8228]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-dg2:          [SKIP][384] ([i915#3555]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_invalid_mode@bad-vtotal.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_lease@lease-revoke:
    - shard-dg2:          [SKIP][386] ([i915#9197]) -> [PASS][387] +32 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_lease@lease-revoke.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_lease@lease-revoke.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-dg2:          [SKIP][388] ([i915#7294]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-basic.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg1:          [DMESG-WARN][390] ([i915#4423]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][392] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [SKIP][394] ([i915#12247]) -> [PASS][395] +5 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:
    - shard-dg2:          [SKIP][396] ([i915#12247] / [i915#8152]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - shard-dg2:          [SKIP][398] ([i915#8152]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [SKIP][400] ([i915#3547]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_pm_rpm@drm-resources-equal.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][402] ([i915#9519]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][404] ([i915#9519]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][406] ([i915#5465]) -> [PASS][407] +2 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_setmode@basic.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_vblank@query-idle-hang:
    - shard-snb:          [INCOMPLETE][408] ([i915#12276]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb6/igt@kms_vblank@query-idle-hang.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb2/igt@kms_vblank@query-idle-hang.html

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1:
    - shard-snb:          [INCOMPLETE][410] -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb6/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb2/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1.html

  * igt@perf@blocking@0-rcs0:
    - shard-rkl:          [FAIL][412] ([i915#10538]) -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-5/igt@perf@blocking@0-rcs0.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@perf@blocking@0-rcs0.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][414] ([i915#4349]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@perf_pmu@busy-double-start@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglu:         [FAIL][416] ([i915#2842]) -> [FAIL][417] ([i915#2876])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-tglu-4/igt@gem_exec_fair@basic-pace@bcs0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][418] ([i915#9197]) -> [SKIP][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][420] -> [SKIP][421] ([i915#9197]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          [SKIP][422] ([i915#5190] / [i915#9197]) -> [SKIP][423] ([i915#5190])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          [SKIP][424] ([i915#5190] / [i915#9197]) -> [SKIP][425] ([i915#4538] / [i915#5190]) +3 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          [SKIP][426] ([i915#4538] / [i915#5190]) -> [SKIP][427] ([i915#5190] / [i915#9197])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][428] ([i915#10307] / [i915#6095]) -> [SKIP][429] ([i915#9197]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][430] ([i915#9197]) -> [SKIP][431] ([i915#10307] / [i915#6095]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][432] ([i915#9197]) -> [SKIP][433] ([i915#12313])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][434] ([i915#9197]) -> [SKIP][435] ([i915#3299])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [TIMEOUT][436] ([i915#7173]) -> [SKIP][437] ([i915#7118] / [i915#9424])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-10/igt@kms_content_protection@legacy.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/index.html

--===============9208150100528163871==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: Drop PM interaction on unbind</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140744/">https://patchwork.freedesktop.org/series/140744/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15615_full -&gt; IGTPW_12009_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12009_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12009_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12009_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-3/igt@gem_exec_gttfill@engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_exec_gttfill@engines.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb4/igt@kms_cursor_legacy@forked-bo@all-pipes.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_rotation_crc@bad-pixel-format:<ul>
<li>{shard-dg2-9}:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-9/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12009_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@drm_fdinfo@busy-idle-check-all@vcs0.html">SKIP</a> ([i915#8414]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-1/igt@drm_read@short-buffer-block.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@drm_read@short-buffer-block.html">SKIP</a> ([i915#9197]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297] / [i915#12577])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#12392] / [i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#8898])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_fair@basic-pace.html">FAIL</a> ([i915#2842]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@vcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_schedule@pi-common@vcs0.html">FAIL</a> ([i915#12296]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +9 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#12193]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy-odd.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@gem_pwrite@basic-self.html">SKIP</a> ([i915#3282]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@gem_readwrite@write-bad-handle.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#4212] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> ([i915#5190] / [i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +127 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +15 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_color@ctm-blue-to-red.html">SKIP</a> ([i915#12655])</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-1/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_color@ctm-negative.html">SKIP</a> ([i915#12655])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453] / [i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453] / [i915#3359]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453] / [i915#3359]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> ([i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#9197]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#1769] / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> ([i915#4423]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#6113]) +1 other test incomplete</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">INCOMPLETE</a> ([i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html">INCOMPLETE</a> ([i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> ([i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#1825]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([i915#5354]) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">SKIP</a> ([i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#12504] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247] / [i915#12504]) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +33 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> ([i915#12247]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> ([i915#4077]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-8/igt@kms_properties@plane-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html">SKIP</a> ([i915#11521])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> ([i915#12316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html">SKIP</a> ([i915#9688]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-gtt.html">SKIP</a> ([i915#9732]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_psr@pr-sprite-mmap-cpu.html">SKIP</a> ([i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-19/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> ([i915#1072] / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#11131] / [i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#11131] / [i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555] / [i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> ([i915#5030]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> ([i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-16/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@kms_vrr@flipline.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-1/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_vrr@negative-basic.html">FAIL</a> ([i915#10393]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#11943] / [i915#12515]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-3/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-1/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-6/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#12564] / [i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-tglu-6/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980] / [i915#12580]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-2/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-6/igt@gem_mmap_offset@clear.html">ABORT</a> ([i915#10729]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_mmap_offset@clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-6/igt@gem_mmap_offset@clear@smem0.html">ABORT</a> ([i915#10029] / [i915#10729]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-1/igt@gem_mmap_offset@clear@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> ([i915#11808] / [i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_color@ctm-max.html">SKIP</a> ([i915#12655]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_color@ctm-max.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_invalid_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_lease@lease-revoke.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_lease@lease-revoke.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg1-13/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#3547]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-6/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb7/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb6/igt@kms_vblank@query-idle-hang.html">INCOMPLETE</a> ([i915#12276]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb2/igt@kms_vblank@query-idle-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-snb6/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-snb2/igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-rkl-5/igt@perf@blocking@0-rcs0.html">FAIL</a> ([i915#10538]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-rkl-7/igt@perf@blocking@0-rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-mtlp-6/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-tglu-4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-tglu-9/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2876])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5190] / [i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009/shard-dg2-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15615/shard-dg2-10/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#7173]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12009">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============9208150100528163871==--
