Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1ACC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 22:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25B310E39F;
	Tue, 13 Aug 2024 22:49:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5A910E39F;
 Tue, 13 Aug 2024 22:49:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1755294385735998097=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_lib=7Ctests=3A_Don=27t_dere?=
 =?utf-8?q?ference_engine_outside_for=5Feach=5Fctx=5Fengine_macro_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 Aug 2024 22:49:42 -0000
Message-ID: <172358938279.615040.12484139361374330389@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
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

--===============1755294385735998097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib|tests: Don't dereference engine outside for_each_ctx_engine macro (rev2)
URL   : https://patchwork.freedesktop.org/series/137235/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15224_full -> IGTPW_11567_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11567_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11567_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11567_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4:
    - shard-dg1:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-18/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4.html

  
Known issues
------------

  Here are the changes found in IGTPW_11567_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#9318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8414]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@drm_fdinfo@busy@bcs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][10] ([i915#7742])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3936])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_busy@semaphore.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#4873])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_caching@reads.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9323]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#6335])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#8562])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8555]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#5882]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4036])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4036])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][34] -> [ABORT][35] ([i915#11713])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-5/igt@gem_exec_big@single.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][36] ([i915#6334])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][37] ([i915#11965]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2846])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#2842]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][43] ([i915#2842]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473] / [i915#4771]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][45] -> [FAIL][46] ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4473])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][49] ([i915#2842]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#3281]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +11 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3281]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-rkl:          NOTRUN -> [ABORT][56] ([i915#7975] / [i915#8213])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4860]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4860])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4565])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4077]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4077]) +10 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4077]) +13 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4083]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_mmap_wc@fault-concurrent.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4083]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3282]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk8/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3282]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#4270]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4270]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4270]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4270]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190] / [i915#8428]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#8411]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4079])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@mmap-offset-banned@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_userptr_blits@mmap-offset-banned@gtt.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3281] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][94] +26 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-snb:          NOTRUN -> [SKIP][95] +61 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb5/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][96] +17 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#2527]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#2856]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4881])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@i915_fb_tiling.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#6412])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][105] ([i915#3591])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11681] / [i915#6621])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][107] ([i915#8346])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#11681]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11681])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#6245])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-glk:          NOTRUN -> [DMESG-WARN][111] ([i915#9311])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#7707])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#4212])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4212]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#8709]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6228])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][117] ([i915#5956])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#1769] / [i915#3555])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#1769] / [i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#1769] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-snb:          [PASS][121] -> [FAIL][122] ([i915#5956]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#5286]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#5286]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3638]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#3638]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5190]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6187]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#10656])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_big_joiner@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#10656])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#6095]) +39 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6095]) +61 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#6095]) +71 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#6095]) +170 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6095]) +43 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3742])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#7213]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#3742]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#4087]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#7828]) +13 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#7828]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#7828]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#7828]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7828]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#3555] / [i915#9979])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3299])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3299])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3116] / [i915#3299])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3299])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#9424]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#9424]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#9424]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3555] / [i915#6944] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#11453])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#11453])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#11453]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#11453]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#3359]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#9809]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#9067])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#9067])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#9067])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4103] / [i915#4213]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-dg2:          [PASS][168] -> [DMESG-WARN][169] ([i915#10166])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#9833])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#9833])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3840])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#3840])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3555] / [i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3555] / [i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3840] / [i915#9053])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4854])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#1839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#1839])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#1839])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#3637]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3637]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#9934]) +8 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
    - shard-dg1:          [PASS][189] -> [FAIL][190] ([i915#2122])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-17/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:
    - shard-snb:          [PASS][191] -> [FAIL][192] ([i915#2122])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#2587] / [i915#2672]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8810])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2587] / [i915#2672]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#2672]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#2672]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2672] / [i915#3555]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [PASS][200] -> [FAIL][201] ([i915#6880])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#8708]) +11 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#1825]) +26 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#5354]) +20 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#10055])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3458]) +9 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][207] +42 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#1825]) +35 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3023]) +18 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3458]) +21 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#10433] / [i915#3458])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8708]) +20 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#8708]) +23 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][214] +48 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#8228]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_hdr@bpc-switch.html
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6301])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][220] +10 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#11614] / [i915#3582]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#6953] / [i915#9423])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#9423]) +32 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][225] +247 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#9423]) +15 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#9423]) +9 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5235] / [i915#9423]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#5235]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9728]) +16 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#5235]) +12 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#5235]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#9728]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9728]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#5354])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][236] -> [FAIL][237] ([i915#9295])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#9340])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8430])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8430])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9519])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9519]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#9519]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#9519])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][246] -> [SKIP][247] ([i915#9519]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9519])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#6524] / [i915#6805])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#6524])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#6524]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#11520]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#11520]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#11520]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#9808]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#11520]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [ABORT][257] ([i915#11897])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9732]) +14 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#9688]) +13 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#1072] / [i915#9732]) +13 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#4077] / [i915#9688]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#1072] / [i915#9732]) +28 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1072] / [i915#9732]) +15 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_psr@psr2-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#1072] / [i915#9673] / [i915#9732]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#11131] / [i915#5190])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#5289])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#5289])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#11131] / [i915#4235])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3555]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8809])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][272] ([IGT#2] / [i915#6493])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][273] ([i915#9196])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
    - shard-dg1:          [PASS][274] -> [FAIL][275] ([i915#9196])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#3555]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#11920])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#11920])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#9906])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#3555] / [i915#9906])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#9906])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#2437] / [i915#9412])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2437] / [i915#9412])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#2437] / [i915#9412])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#2434])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@perf@mi-rpc.html
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#2434])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#2434])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@perf@mi-rpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#2434])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@perf@mi-rpc.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#8850])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3708] / [i915#4077]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3708])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#3708])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#9917])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#9917])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#9917]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#9917])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][297] ([i915#9781])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][298] ([i915#9781])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-glk:          NOTRUN -> [FAIL][299] ([i915#9781])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk1/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#4818])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][301] ([i915#7742]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][303] ([i915#5784]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-7/igt@gem_eio@reset-stress.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gem_eio@reset-stress.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][305] -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][307] ([i915#10131] / [i915#9820]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-glk:          [FAIL][309] ([i915#11859]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][311] ([i915#2346]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - shard-dg1:          [INCOMPLETE][313] -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_cursor_legacy@single-move@pipe-b.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][315] -> [PASS][316] +4 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-dg2:          [FAIL][317] ([i915#6880]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][319] ([i915#9519]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4:
    - shard-dg1:          [FAIL][321] ([i915#9196]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][323] ([i915#4349]) -> [PASS][324] +3 other tests pass
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         [FAIL][325] ([i915#11822]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-dg2:          [FAIL][327] ([i915#11822]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_busy@hang@rcs0:
    - shard-dg2:          [INCOMPLETE][329] -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@prime_busy@hang@rcs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@prime_busy@hang@rcs0.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [ABORT][331] ([i915#11814]) -> [ABORT][332] ([i915#11814] / [i915#11815])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [FAIL][333] ([i915#2876]) -> [FAIL][334] ([i915#2842])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][335] ([i915#1982] / [i915#4936] / [i915#5493]) -> [TIMEOUT][336] ([i915#5493])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][337] ([i915#10887] / [i915#9820]) -> [ABORT][338] ([i915#9820])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_content_protection@lic-type-0:
    - shard-snb:          [SKIP][339] -> [INCOMPLETE][340] ([i915#8816])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb2/igt@kms_content_protection@lic-type-0.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          [SKIP][341] ([i915#11453] / [i915#3359]) -> [SKIP][342] ([i915#11453])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][343] ([i915#11453]) -> [SKIP][344] ([i915#11453] / [i915#3359])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         [SKIP][345] ([i915#3555] / [i915#8810]) -> [ABORT][346] ([i915#10354])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][347] ([i915#3458]) -> [SKIP][348] ([i915#10433] / [i915#3458]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][349] ([i915#10433] / [i915#3458]) -> [SKIP][350] ([i915#3458]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          [SKIP][351] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][352] ([i915#1072] / [i915#9732]) +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          [SKIP][353] ([i915#1072] / [i915#9732]) -> [SKIP][354] ([i915#1072] / [i915#9673] / [i915#9732]) +10 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][355] ([i915#11131] / [i915#4235] / [i915#5190]) -> [SKIP][356] ([i915#11131] / [i915#5190])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][357] ([i915#7484]) -> [FAIL][358] ([i915#9100])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
  [i915#11822]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11822
  [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
  [i915#11897]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11897
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
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
  [i915#2876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
  [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7967 -> IGTPW_11567
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15224: 924db73e261b7bfd4b70b14db61197f48bf09426 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11567: 11567
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html

--===============1755294385735998097==
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
<tr><td><b>Series:</b></td><td>lib|tests: Don&#x27;t dereference engine outside for_each_ctx_engine macro (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137235/">https://patchwork.freedesktop.org/series/137235/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15224_full -&gt; IGTPW_11567_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11567_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11567_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11567_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-18/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@kms_vblank@query-forked-hang@pipe-a-hdmi-a-4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11567_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@drm_fdinfo@busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_caching@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-5/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846">i915#2846</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_exec_fair@basic-deadline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +2 other tests fail</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473">i915#4473</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_mmap_gtt@basic-read-write-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk8/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_pwrite_snooped.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-banned@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@gem_userptr_blits@mmap-offset-banned@gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gen3_render_tiledy_blits.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@i915_pm_rps@reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346">i915#8346</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-4/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166">i915#10166</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-17/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> +247 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728">i915#9728</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_prime@basic-crc-vgem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11897">i915#11897</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-1/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493">i915#6493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-13/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850">i915#8850</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-15/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk1/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781">i915#9781</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-7/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859">i915#11859</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk7/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_cursor_legacy@single-move@pipe-b.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-16/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-14/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11822">i915#11822</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11822">i915#11822</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@prime_busy@hang@rcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@prime_busy@hang@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815">i915#11815</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876">i915#2876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887">i915#10887</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820">i915#9820</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-snb2/igt@kms_content_protection@lic-type-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-snb7/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816">i915#8816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354">i915#10354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15224/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11567/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7967 -&gt; IGTPW_11567</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15224: 924db73e261b7bfd4b70b14db61197f48bf09426 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11567: 11567<br />
  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1755294385735998097==--
