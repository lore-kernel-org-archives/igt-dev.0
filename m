Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD46CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71D1133C9;
	Wed, 10 Apr 2024 14:25:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843701133C9;
 Wed, 10 Apr 2024 14:25:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7259956033310862169=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Check_the_validity_of_selec?=
 =?utf-8?q?ted_pipe/output_combo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Apr 2024 14:25:01 -0000
Message-ID: <171275910151.1320942.211238202142982052@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
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

--===============7259956033310862169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check the validity of selected pipe/output combo (rev2)
URL   : https://patchwork.freedesktop.org/series/132128/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7802_full -> IGTPW_10991_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10991_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10991_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10991_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_exec_gttfill@engines@vecs0:
    - shard-mtlp:         [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@gem_exec_gttfill@engines@vecs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_exec_gttfill@engines@vecs0.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk3/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk2/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_10991_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#7701]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#7701])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +20 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][13] -> [SKIP][14] ([i915#1849] / [i915#2582])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-10/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@fbdev@info.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#3281]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [ABORT][18] ([i915#9846])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6335]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#1099])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#280])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][27] ([i915#7975] / [i915#8213])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][28] -> [FAIL][29] ([i915#5784])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_eio@reset-stress.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4771]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#9606])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539] / [i915#4852]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#2842])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#2842]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-3/igt@gem_exec_fair@basic-none@vecs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4473] / [i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][39] ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [PASS][40] -> [FAIL][41] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_gttfill@engines@vecs1:
    - shard-dg2:          [PASS][45] -> [INCOMPLETE][46] ([i915#10669])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@gem_exec_gttfill@engines@vecs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_exec_gttfill@engines@vecs1.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +11 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4812]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4860]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-dg2:          [PASS][53] -> [SKIP][54] ([i915#2575]) +21 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_huc_copy@huc-copy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4613] / [i915#7582])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][57] ([i915#10378])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
    - shard-dg2:          [PASS][58] -> [FAIL][59] ([i915#10378]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4565])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#9643])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@close-race:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4077]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3282]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +8 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4270]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#5190] / [i915#8428]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#2575] / [i915#5190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8428])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#8411])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4079]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4885]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +13 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +10 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3323])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#4880])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4880])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][93] +60 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb7/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#2856]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4881])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][99] -> [ABORT][100] ([i915#10131] / [i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8436])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6590])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#6590])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [PASS][104] -> [FAIL][105] ([i915#3591])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#9980])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#8925])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#2575]) +40 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][109] -> [SKIP][110] ([i915#7984])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-6/igt@i915_power@sanity.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#6245])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][112] ([i915#9311])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][113] ([i915#9311])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4215])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#8709]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#9531])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#9531])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#5286]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#5286])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5286]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3638]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][127] +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg2:          [PASS][129] -> [SKIP][130] +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][131] ([i915#3743])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#5190]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][133] -> [FAIL][134] ([i915#3743])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6187])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#10656])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#6095]) +91 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#6095]) +31 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10278])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6095]) +75 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#10278]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#6095]) +15 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#10307] / [i915#6095]) +133 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#10278]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#3742])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#3742])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#7213]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4087]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#7828]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7828]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#7828]) +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#7828]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#7828]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7118] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3116] / [i915#3299])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3299])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3116])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3299])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#7116])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#7116] / [i915#9424]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7118] / [i915#9424]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3555]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +9 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8814])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3555]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][171] +195 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3555]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3359])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#8814]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3359]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#4103]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#4103] / [i915#4213]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#9067])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-snb:          NOTRUN -> [DMESG-WARN][179] ([i915#10166])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb7/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-tglu:         [PASS][180] -> [DMESG-WARN][181] ([i915#10166] / [i915#1982])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#9723])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#9227])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#9723])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#8588])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3804])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][187] -> [SKIP][188] ([i915#1257])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_dp_aux_dev.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#1257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3555] / [i915#3840]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3840] / [i915#9053])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#1839])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3637]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#9934]) +7 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3637]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#2672]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8810])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#2672]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#5274])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][207] +22 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][208] -> [FAIL][209] ([i915#6880])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#8708]) +10 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3458]) +11 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8708]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8708]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#1825]) +30 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][215] +52 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5354]) +26 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#5439])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#9766])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#9766])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3458]) +25 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3023]) +16 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#1825]) +12 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#433])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3555] / [i915#8228])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#3555] / [i915#8228]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8228]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8228]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#8228])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#9457]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#4816])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#6301])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#8821])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          [PASS][233] -> [FAIL][234] ([i915#8292])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9423]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#9423]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9423]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9423]) +7 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#5176] / [i915#9423]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#5235]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#5235]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#5235]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5235] / [i915#9423]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2575] / [i915#9423])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#5354]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#5354])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9685])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#9685])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9685])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9340])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][251] -> [SKIP][252] ([i915#9519]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][253] -> [SKIP][254] ([i915#9980])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#6524] / [i915#6805])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#6524])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#6524])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#9808]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][259] +56 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#9683])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#9683])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#9683])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#9688]) +6 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9732]) +11 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#1072] / [i915#9732]) +15 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1072] / [i915#9732]) +15 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#1072] / [i915#9732]) +25 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9685])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#4235])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#5289])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][271] ([IGT#2] / [i915#6493])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-snb:          [PASS][272] -> [FAIL][273] ([i915#9196])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#9906])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9906])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-glk:          NOTRUN -> [SKIP][276] ([i915#2437])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#2437])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#2437])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#2437])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@buffer-fill:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#5608]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@perf@buffer-fill.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2434] / [i915#7387])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#2433])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][283] ([i915#4349]) +3 other tests fail
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#8850])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8807])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][286] ([i915#6806])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@interrupts:
    - shard-dg2:          [PASS][287] -> [SKIP][288] ([i915#5608]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@perf_pmu@interrupts.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@perf_pmu@interrupts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#8516])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][290] ([i915#5493])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3708] / [i915#4077])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3708] / [i915#4077])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3708]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3708])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3708])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#3708])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-glk:          NOTRUN -> [FAIL][297] ([i915#10291])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk1/igt@runner@aborted.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#9917]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-dg1:          NOTRUN -> [FAIL][299] ([i915#9781])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-mtlp:         NOTRUN -> [FAIL][300] ([i915#9779])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-dg2:          NOTRUN -> [FAIL][301] ([i915#9779])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@syncobj_wait@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][302] +40 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#2575] / [i915#4818])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@destroy-valid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#2575]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#2575]) +14 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html

  * igt@vc4/vc4_perfmon@create-perfmon-invalid-events:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#7711]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html

  * igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#7711]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html

  * igt@vc4/vc4_tiling@set-bad-flags:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#2575]) +14 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@vc4/vc4_tiling@set-bad-flags.html

  * igt@vc4/vc4_wait_bo@bad-pad:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#7711]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@vc4/vc4_wait_bo@bad-pad.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#7711]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][311] ([i915#6268]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [FAIL][313] ([i915#2842]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][315] ([i915#2842]) -> [PASS][316] +2 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][317] ([i915#2842]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - shard-dg2:          [FAIL][319] ([i915#10378]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@gem_lmem_swapping@basic@lmem0.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg2:          [FAIL][321] ([i915#10446]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg1:          [FAIL][323] ([i915#10378]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][325] ([i915#9820]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][327] ([i915#9849]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [FAIL][329] ([i915#3743]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_color@ctm-0-75@pipe-a:
    - shard-tglu:         [INCOMPLETE][331] -> [PASS][332] +1 other test pass
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_color@ctm-0-75@pipe-a.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_color@ctm-0-75@pipe-a.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-glk:          [DMESG-WARN][333] ([i915#10166]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk2/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][335] ([i915#2122]) -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [ABORT][337] -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb7/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [FAIL][339] ([i915#79]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:
    - shard-dg2:          [INCOMPLETE][341] ([i915#6113]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-dg2:          [FAIL][343] ([i915#6880]) -> [PASS][344] +1 other test pass
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg1:          [DMESG-WARN][345] ([i915#4423]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-tglu:         [INCOMPLETE][347] ([i915#8797]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format@pipe-a:
    - shard-mtlp:         [ABORT][349] ([i915#10698]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-a.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][351] ([i915#9519]) -> [PASS][352] +1 other test pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][353] ([i915#9519]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-snb:          [FAIL][355] ([i915#9196]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [FAIL][357] ([i915#9196]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][359] -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk8/igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk5/igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [DMESG-WARN][361] ([i915#4391] / [i915#4423]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@perf_pmu@module-unload.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-dg1:          [INCOMPLETE][363] -> [FAIL][364] ([i915#5784])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@gem_eio@kms.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-dg2:          [SKIP][365] ([i915#3539] / [i915#4852]) -> [SKIP][366] ([i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@gem_exec_fair@basic-none-solo.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          [SKIP][367] ([i915#5107]) -> [SKIP][368] ([i915#2575])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][369] ([i915#4537] / [i915#4812]) -> [SKIP][370] ([i915#2575])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][371] ([i915#4860]) -> [SKIP][372] ([i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          [SKIP][373] ([i915#4423] / [i915#4565]) -> [SKIP][374] ([i915#4565])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-dg2:          [SKIP][375] ([i915#4083]) -> [SKIP][376] ([i915#2575]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@gem_mmap_wc@set-cache-level.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          [SKIP][377] ([i915#3297]) -> [SKIP][378] ([i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-tglu:         [FAIL][379] ([i915#3591]) -> [WARN][380] ([i915#2681])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg1:          [SKIP][381] ([i915#4077] / [i915#4423]) -> [SKIP][382] ([i915#4077])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@i915_suspend@fence-restore-untiled.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2:          [SKIP][383] ([i915#7828]) -> [SKIP][384] ([i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][385] ([i915#8812]) -> [SKIP][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-wc.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-dg2:          [SKIP][387] -> [SKIP][388] ([i915#2575]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][389] ([i915#3458]) -> [SKIP][390] ([i915#10433] / [i915#3458]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][391] ([i915#5354]) -> [SKIP][392] +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][393] ([i915#3458]) -> [SKIP][394] +4 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][395] ([i915#8708]) -> [SKIP][396] +4 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][397] ([i915#9340]) -> [SKIP][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr@fbc-pr-sprite-mmap-cpu:
    - shard-dg2:          [SKIP][399] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][400] +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2:          [SKIP][401] ([i915#1072] / [i915#9732]) -> [SKIP][402] +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@kms_psr@pr-cursor-mmap-cpu.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          [SKIP][403] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][404] ([i915#1072] / [i915#9732]) +9 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          [SKIP][405] ([i915#3555]) -> [SKIP][406] ([i915#2575]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][407] ([i915#8623]) -> [SKIP][408] ([i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
  [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
  [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
  [i915#10291]: https://gitlab.freedesktop.org/drm/intel/issues/10291
  [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10433]: https://gitlab.freedesktop.org/drm/intel/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/intel/issues/10434
  [i915#10446]: https://gitlab.freedesktop.org/drm/intel/issues/10446
  [i915#10656]: https://gitlab.freedesktop.org/drm/intel/issues/10656
  [i915#10669]: https://gitlab.freedesktop.org/drm/intel/issues/10669
  [i915#10698]: https://gitlab.freedesktop.org/drm/intel/issues/10698
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/intel/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/770

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/index.html

--===============7259956033310862169==
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
<tr><td><b>Series:</b></td><td>Check the validity of selected pipe/output combo (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132128/">https://patchwork.freedesktop.org/series/132128/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7802_full -&gt; IGTPW_10991_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10991_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10991_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-snb-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10991_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@gem_exec_gttfill@engines@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_exec_gttfill@engines@vecs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk3/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk2/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10991_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/770">i915#7701</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/770">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> ([i915#8414]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-10/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@gem_ctx_persistence@smoketest.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@gem_exec_gttfill@engines@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_exec_gttfill@engines@vecs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10669">i915#10669</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#9643])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@gem_mmap_wc@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_pread@exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a> / [i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb7/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10131">i915#10131</a> / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#8436])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#9980])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@i915_pm_rps@waitboost.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +91 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10278">i915#10278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10278">i915#10278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10278">i915#10278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / [i915#9424]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> +195 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> ([i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb7/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#9934]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-14/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> ([i915#9457]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / [i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9980])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@kms_psr2_sf@fbc-cursor-plane-update-sf@psr2-pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> ([i915#9688]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-2/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> ([i915#9732]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9732]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6493">i915#6493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8807])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@perf_pmu@interrupts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@perf_pmu@interrupts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10291">i915#10291</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-3/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9779])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-7/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9779])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html">SKIP</a> +40 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-2/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-invalid-events:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-4/igt@vc4/vc4_perfmon@create-perfmon-invalid-events.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-16/igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-flags:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-7/igt@vc4/vc4_tiling@set-bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@bad-pad:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@vc4/vc4_wait_bo@bad-pad.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10446">i915#10446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_color@ctm-0-75@pipe-a.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-6/igt@kms_color@ctm-0-75@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk8/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk2/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb7/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb1/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6113">i915#6113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#8797]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-mtlp-7/igt@kms_plane@pixel-format@pipe-a.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10698">i915#10698</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-mtlp-5/igt@kms_plane@pixel-format@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-snb4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-glk8/igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-glk5/igt@kms_vblank@wait-busy-hang@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-14/igt@gem_eio@kms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-5/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5107">i915#5107</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg1-16/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-cpu.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-8/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#9732]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7802/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10991/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============7259956033310862169==--
