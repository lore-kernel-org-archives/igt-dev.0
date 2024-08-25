Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2D2C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 14:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FA10E02C;
	Sun, 25 Aug 2024 14:40:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9380010E02C;
 Sun, 25 Aug 2024 14:40:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2980003472218997677=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_runner/settings=3A_set_PRUN?=
 =?utf-8?q?E=5FKEEP=5FALL_as_default_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 25 Aug 2024 14:40:05 -0000
Message-ID: <172459680557.765922.9593320479885112828@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240823161409.79198-1-kamil.konieczny@linux.intel.com>
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

--===============2980003472218997677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner/settings: set PRUNE_KEEP_ALL as default (rev2)
URL   : https://patchwork.freedesktop.org/series/135116/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7989_full -> IGTPW_11625_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11625_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11625_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html

Participating hosts (8 -> 9)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11625_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-rkl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][2] +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][5] +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  
Known issues
------------

  Here are the changes found in IGTPW_11625_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@drm_fdinfo@busy-idle-check-all.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][12] -> [FAIL][13] ([i915#7742])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +13 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [PASS][15] -> [FAIL][16] ([i915#11900] / [i915#7742])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#12027])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglu:         [PASS][24] -> [FAIL][25] ([i915#12027])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#5882])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#5882])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][31] ([i915#11965])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@gem_exec_capture@capture.html
    - shard-dg2:          NOTRUN -> [FAIL][32] ([i915#11965])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@gem_exec_capture@capture.html
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#11965])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#6334])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#6334]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#6334])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#6334])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-flow:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-tglu:         NOTRUN -> [FAIL][40] ([i915#2842]) +7 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][41] ([i915#2842]) +5 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][42] ([i915#2842]) +9 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [PASS][43] -> [FAIL][44] ([i915#2842]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3281]) +12 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#7276])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         NOTRUN -> [ABORT][53] ([i915#7975] / [i915#8213])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-tglu:         [PASS][54] -> [ABORT][55] ([i915#7975] / [i915#8213])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-5/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4565])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg1:          NOTRUN -> [TIMEOUT][61] ([i915#5493])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#4613]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap@basic:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4083]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-5/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4083]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@bench:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_pread@bench.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#8411])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4079])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4879])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][84] ([i915#3323])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-10/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3297]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][87] +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#2527]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#6227])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][94] -> [ABORT][95] ([i915#10131])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#6590])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@i915_pm_freq_mult@media-freq.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#6590])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_pm_freq_mult@media-freq.html
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#6590])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_freq_mult@media-freq.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6590])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][100] ([i915#2681]) +1 other test warn
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-dg1:          NOTRUN -> [FAIL][101] ([i915#3591])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#11681])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#11681]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#4387])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#7984])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#5723])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][107] ([i915#9311])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@i915_selftest@mock.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][108] ([i915#9311])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][109] ([i915#9311]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk6/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][110] ([i915#9311])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@i915_selftest@mock.html
    - shard-dg2:          NOTRUN -> [DMESG-WARN][111] ([i915#9311])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_selftest@mock.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][112] ([i915#9311])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@i915_selftest@mock.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][113] ([i915#9311])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_selftest@mock.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#8709]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][116] ([i915#4423])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#9531])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-glk:          NOTRUN -> [FAIL][118] ([i915#11859])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          NOTRUN -> [FAIL][119] ([i915#5956])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         NOTRUN -> [FAIL][120] ([i915#11808] / [i915#5956])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][121] -> [FAIL][122] ([i915#11808] / [i915#5956])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
    - shard-dg1:          [PASS][123] -> [FAIL][124] ([i915#5956])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5286]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#5286]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#5286])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][129] +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3638]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3638]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5190]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#10656]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10656])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6095]) +67 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#10307] / [i915#6095]) +224 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#12042]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][139] +380 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#6095]) +189 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +108 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6095]) +93 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#7213] / [i915#9010])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#11616] / [i915#7213]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#4087])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4087]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7828]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#7828]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7828]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#7828]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#7828])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3299])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3116])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#6944] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_content_protection@lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][156] ([i915#7173])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#7118] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#7116] / [i915#9424]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3555] / [i915#8814])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#11453]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#11453]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3555]) +9 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3359])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#4103]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4103] / [i915#4213]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#9067])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#9067])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4213])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-dg1:          [PASS][169] -> [DMESG-WARN][170] ([i915#4423])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-16/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#8588])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3804])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#1769] / [i915#3555] / [i915#3804])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3555] / [i915#8812])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555] / [i915#3840])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3840])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3955])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3469])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3637])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3637]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-snb:          NOTRUN -> [FAIL][186] ([i915#2122])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][187] -> [FAIL][188] ([i915#2122])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][189] +26 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9934]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#2672])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555]) +9 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#2672])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#2587] / [i915#2672] / [i915#3555]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2587] / [i915#2672] / [i915#3555]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555] / [i915#5190]) +11 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#2587] / [i915#2672]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555]) +18 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#2587] / [i915#2672]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8810])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8813]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2672] / [i915#3555]) +17 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555]) +18 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#2672]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#2672] / [i915#3555] / [i915#8813]) +25 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [PASS][206] -> [FAIL][207] ([i915#6880])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#1825]) +41 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8708]) +28 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#5439])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3023]) +26 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][212] +56 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8708]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#1825]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9766])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3458]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8708]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][218] +29 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5354]) +11 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3458]) +15 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#3555] / [i915#6403] / [i915#8826])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#6301])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#6301])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][225] ([i915#7862]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#3555]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_plane_lowres@tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#10226] / [i915#3555] / [i915#8821])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#3582]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#8292])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [FAIL][230] ([i915#8292])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#9423]) +23 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9423]) +26 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#9423]) +15 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#5176]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#9423]) +10 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#9423])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#5176] / [i915#9423])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#9423])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#6953] / [i915#9423]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#6953]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#9728]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#5235]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3555] / [i915#5235]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#5235] / [i915#6953]) +7 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#6953])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3555]) +6 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#9423])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#6953])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#9728]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#3555] / [i915#5235] / [i915#6953]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#5354])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#9685])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][253] ([i915#9295])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3361])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu:         [PASS][255] -> [FAIL][256] ([i915#9295])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3361])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#4281])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][259] -> [SKIP][260] ([i915#9519])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#9519])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#9519])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][263] -> [SKIP][264] ([i915#9519])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#6524])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#11520])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-5/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#9808]) +13 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#11520]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#11520]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#11520]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#4348])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#9683])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9683])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9683])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#9732]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_psr@fbc-pr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#1072] / [i915#9732]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#9688]) +41 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#4077] / [i915#9688]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#1072] / [i915#9732]) +22 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#1072] / [i915#9732]) +19 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#9685]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#4884])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#4235])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#5289])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#4235])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#5289])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#5289])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#3555] / [i915#5030] / [i915#9041])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3555]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#8623]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#8623])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-tglu:         NOTRUN -> [FAIL][292] ([i915#9196])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][293] -> [FAIL][294] ([i915#9196]) +1 other test fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#11920])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9906])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#2437])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#2437])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#2437])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#2437] / [i915#9412])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][301] ([i915#9100])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][302] +54 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][303] ([i915#4349])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-idle-no-semaphores:
    - shard-dg2:          NOTRUN -> [FAIL][304] ([i915#4349]) +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores.html

  * igt@perf_pmu@busy-idle-no-semaphores@ccs0:
    - shard-dg2:          [PASS][305] -> [FAIL][306] ([i915#4349])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-5/igt@perf_pmu@busy-idle-no-semaphores@ccs0.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores@ccs0.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#8807])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@frequency:
    - shard-dg2:          NOTRUN -> [FAIL][308] ([i915#6806])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@frequency.html
    - shard-dg1:          NOTRUN -> [FAIL][309] ([i915#6806])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@perf_pmu@frequency.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#8516]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][311] ([i915#9351])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#3708] / [i915#4077])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#3291] / [i915#3708]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@prime_vgem@basic-fence-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#3708])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#3708] / [i915#4077]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#3708])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#9917])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9917])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][319] ([i915#9781])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][320] ([i915#9781]) +1 other test fail
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@syncobj_timeline@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][321] ([i915#11980]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-9/igt@gem_ctx_persistence@hostile.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         [FAIL][323] ([i915#11980]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-4/igt@gem_ctx_persistence@hostile.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][325] ([i915#5784]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@gem_eio@kms.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@gem_eio@kms.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][327] ([i915#11713]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@gem_exec_big@single.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@gem_exec_big@single.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-tglu:         [TIMEOUT][329] ([i915#3778]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@gem_exec_endless@dispatch@vecs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][331] ([i915#2842]) -> [PASS][332] +1 other test pass
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][333] ([i915#5493]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [ABORT][335] ([i915#5566]) -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][337] ([i915#9820]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][339] ([i915#7984]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-4/igt@i915_power@sanity.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][341] ([i915#9500]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@i915_selftest@live@workarounds.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@i915_selftest@live@workarounds.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [DMESG-FAIL][343] ([i915#11627] / [i915#2017]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-mtlp:         [FAIL][345] ([i915#5138]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:
    - shard-tglu:         [FAIL][347] ([i915#2122]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
    - shard-snb:          [FAIL][349] ([i915#2122]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
    - shard-rkl:          [FAIL][351] ([i915#11961]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg1:          [ABORT][353] ([i915#4423]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-18/igt@kms_force_connector_basic@force-connector-state.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-snb:          [SKIP][355] -> [PASS][356] +2 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][357] ([i915#3555] / [i915#8228]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-2/igt@kms_hdr@static-toggle.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][359] ([i915#9519]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][361] ([i915#9519]) -> [PASS][362] +1 other test pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          [FAIL][363] ([i915#5465]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][365] ([IGT#2]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-1/igt@kms_sysfs_edid_timing.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu:         [FAIL][367] ([i915#3591]) -> [WARN][368] ([i915#2681])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          [SKIP][369] ([i915#9424]) -> [TIMEOUT][370] ([i915#7173])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-1/igt@kms_content_protection@lic-type-0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][371] ([i915#11453]) -> [SKIP][372] ([i915#11453] / [i915#3359]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-dg1:          [SKIP][373] -> [SKIP][374] ([i915#4423])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][375] ([i915#10433] / [i915#3458]) -> [SKIP][376] ([i915#3458]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2:          [SKIP][377] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][378] ([i915#1072] / [i915#9732]) +10 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-blt.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg2:          [SKIP][379] ([i915#1072] / [i915#9732]) -> [SKIP][380] ([i915#1072] / [i915#9673] / [i915#9732]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_psr@psr2-cursor-plane-move.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][381] ([i915#11131] / [i915#4235] / [i915#5190]) -> [SKIP][382] ([i915#11131] / [i915#5190])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [FAIL][383] ([i915#7484]) -> [FAIL][384] ([i915#9100])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
  [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#11627]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11627
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
  [i915#11900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11900
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11961]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11961
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#12027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027
  [i915#12042]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
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
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6403
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html

--===============2980003472218997677==
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
<tr><td><b>Series:</b></td><td>runner/settings: set PRUNE_KEEP_ALL as default (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135116/">https://patchwork.freedesktop.org/series/135116/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7989_full -&gt; IGTPW_11625_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11625_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11625_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/index.html</p>
<h2>Participating hosts (8 -&gt; 9)</h2>
<p>Additional (1): shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11625_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11625_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@drm_fdinfo@busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@drm_fdinfo@isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-2/igt@drm_fdinfo@virtual-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11900">i915#11900</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027">i915#12027</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12027">i915#12027</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@gem_ctx_persistence@engines-persistence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_exec_fair@basic-flow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@gem_exec_fair@basic-none-vip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-5/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_lmem_swapping@smem-oom.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_mmap_wc@write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-10/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-5/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131">i915#10131</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk6/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>) +1 other test dmesg-warn</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311">i915#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_atomic@plane-invalid-params.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859">i915#11859</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808">i915#11808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +224 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12042">i915#12042</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +380 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +189 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010">i915#9010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616">i915#11616</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087">i915#4087</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087">i915#4087</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-16/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588">i915#8588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> +26 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#9934]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6403">i915#6403</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-18/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#9728]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#9728]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-5/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> ([i915#9808]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_psr@fbc-pr-primary-mmap-cpu.html">SKIP</a> ([i915#9732]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@kms_psr@fbc-pr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> ([i915#9688]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / [i915#9688]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf@non-zero-reason.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb5/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-no-semaphores:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-no-semaphores@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-5/igt@perf_pmu@busy-idle-no-semaphores@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-3/igt@perf_pmu@event-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf_pmu@frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806">i915#6806</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-14/igt@perf_pmu@frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@prime_mmap@test_aperture_limit.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351">i915#9351</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781]) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-9/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980">i915#11980</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-4/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980">i915#11980</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-6/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-2/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@gem_exec_endless@dispatch@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i915#3778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@gem_exec_endless@dispatch@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-glk8/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-4/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11627">i915#11627</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb7/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11961">i915#11961</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-18/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-16/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_content_protection@lic-type-0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453">i915#11453</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-1/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-4/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-11/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131">i915#11131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7989/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484">i915#7484</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11625/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>)</li>
</ul>
</li>
</ul>
<p>[i915#</p>

</body>
</html>

--===============2980003472218997677==--
