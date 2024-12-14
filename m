Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB91E7716A
	for <igt-dev@archiver.kernel.org>; Sat, 14 Dec 2024 05:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ECF10E0CE;
	Sat, 14 Dec 2024 05:57:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5936810E0CE;
 Sat, 14 Dec 2024 05:57:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fpm=5Fr?=
 =?utf-8?q?pm=3A_Add_mappable_GTT_check_in_cursor_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 14 Dec 2024 05:57:21 -0000
Message-ID: <173415584135.2399500.8925654052671574845@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213103228.1920627-1-jeevan.b@intel.com>
In-Reply-To: <20241213103228.1920627-1-jeevan.b@intel.com>
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

Series: tests/intel/kms_pm_rpm: Add mappable GTT check in cursor test
URL   : https://patchwork.freedesktop.org/series/142544/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15843_full -> IGTPW_12314_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12314_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12314_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12314_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-external:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-2/igt@gem_eio@in-flight-external.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@gem_eio@in-flight-external.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][5] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk4/igt@kms_async_flips@crc-atomic.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb4/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][7] +3 other tests crash
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          [PASS][8] -> [SKIP][9] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-13/igt@kms_pm_rpm@cursor.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-mtlp:         [PASS][10] -> [SKIP][11] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-5/igt@kms_pm_rpm@cursor-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@kms_pm_rpm@cursor-dpms.html
    - shard-dg2:          [PASS][12] -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-4/igt@kms_pm_rpm@cursor-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-4:
    - {shard-dg2-9}:      NOTRUN -> [FAIL][14] +4 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-9/igt@kms_async_flips@crc-atomic@pipe-c-dp-4.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15843_full and IGTPW_12314_full:

### New IGT tests (2) ###

  * igt@kms_setmode@basic-clone-single-crtc@pipe-a-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_setmode@basic-clone-single-crtc@pipe-b-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_12314_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#8411]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@intel-bb-blit-x:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][19] ([i915#12964]) +10 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@api_intel_bb@intel-bb-blit-x.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#11078])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8414]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +16 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@drm_fdinfo@isolation.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#13008])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#13008])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#13008])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#13008])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#7697])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#6335]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#8562])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][35] ([i915#12353]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#1099]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8555]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#280]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#280]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][42] ([i915#12543] / [i915#5784])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][43] ([i915#8898])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4771]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#8555]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4525]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4525]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][50] ([i915#11965]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3281]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +13 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3281]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4537])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-5/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4537] / [i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][60] -> [INCOMPLETE][61] ([i915#13196]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk5/igt@gem_exec_suspend@basic-s3@smem.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk6/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#4613])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#4613]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][68] ([i915#5493]) +1 other test timeout
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-1/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#284])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@gem_media_vme.html

  * igt@gem_mmap@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +14 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@gem_mmap_gtt@basic-read.html

  * igt@gem_mmap_gtt@close-race:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4083]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][78] ([i915#2658])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb2/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][79] ([i915#2658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12964])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][82] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-tglu:         [PASS][84] -> [SKIP][85] ([i915#4270]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#4270])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3282]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-10/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4079]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4077]) +15 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4079]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297] / [i915#3323])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3282] / [i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#2527] / [i915#2856]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][106] -> [ABORT][107] ([i915#9820])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][108] -> [ABORT][109] ([i915#10131] / [i915#9820])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#6412])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#6412])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#8399])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][114] ([i915#3591]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][115] ([i915#4423])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [PASS][116] -> [ABORT][117] ([i915#12773])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][118] ([i915#12797])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][121] -> [SKIP][122] ([i915#7984])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-7/igt@i915_power@sanity.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#7984])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#5723])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][125] ([i915#9311]) +1 other test dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][126] ([i915#9311]) +1 other test dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][127] ([i915#9311])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][128] ([i915#7443])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4212])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-10/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][131] -> [DMESG-FAIL][132] ([i915#12964]) +1 other test dmesg-fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#8709]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#8709]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][136] ([i915#13287])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb4/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-dg1:          [PASS][137] -> [DMESG-WARN][138] ([i915#4423])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-12/igt@kms_atomic@atomic-invalid-params.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#9531])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#9531])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][141] ([i915#1769]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][142] ([i915#1769])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][143] -> [FAIL][144] ([i915#11808] / [i915#5956]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][145] ([i915#11808]) +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538] / [i915#5286]) +7 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5286]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#5286]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#5286]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][150] -> [DMESG-FAIL][151] ([i915#11627] / [i915#13314])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3638]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#3638])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][154] +10 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][155] +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#4538] / [i915#5190]) +10 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#4538]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#12313]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#6095]) +64 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#10307] / [i915#6095]) +143 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#12313])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6095]) +14 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12805])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#6095]) +85 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#12805])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#6095]) +147 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#6095]) +19 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#12313])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7213]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3742])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#4087]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7828]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#7828]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#7828]) +10 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#7828]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7828]) +10 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#7828]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3555] / [i915#9979])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#7116] / [i915#9424]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#4423] / [i915#9424])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3116]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#7118])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#13049]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8814])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3555]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#13049]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#13049]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#4213]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#13046] / [i915#5354]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#9809]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][195] +15 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9067])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#9067])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#4103])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#9723])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-9/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3469])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1839])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#1839]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#658])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#658])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3637])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3637]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#9934]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#8381])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#8381])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9934]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3637])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][218] ([i915#4839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9934]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][220] -> [FAIL][221] ([i915#11989]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][222] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][223] ([i915#12745])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][224] -> [FAIL][225] ([i915#11989]) +2 other tests fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#2587] / [i915#2672]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2672]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672] / [i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#2587] / [i915#2672])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#2672] / [i915#8813]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][240] -> [SKIP][241]
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#1825]) +35 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#8708]) +17 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#10056])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3458]) +15 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#5354]) +20 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] +19 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#5439])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#5439])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#8708]) +17 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#1825]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#8708]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][253] +640 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][254] +99 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#3023]) +26 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3458]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1187] / [i915#12713])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8228]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8228])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][262] -> [SKIP][263] ([i915#3555] / [i915#8228]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#10656]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12388])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#12394])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#12394])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12339])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#10656])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#10656])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#12388])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#12388])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#6301])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][274] +30 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][275] ([i915#13026])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][276] ([i915#12177])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][277] ([i915#12169])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][278] ([i915#10647]) +3 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12247]) +9 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#12247]) +18 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3555]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#12247]) +13 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#12247] / [i915#6953])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#12247] / [i915#6953] / [i915#9423])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12247]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12247] / [i915#3555] / [i915#6953])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#12247]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#12247] / [i915#3555] / [i915#9423])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#12247] / [i915#3555])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#5354])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#12343])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#12343])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#9812])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#5354])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#9812])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#9685])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#3828])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][299] -> [FAIL][300] ([i915#9295])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9685])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][302] -> [SKIP][303] ([i915#9519])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#9519]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#9519])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][306] -> [SKIP][307] ([i915#9519]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][308] -> [INCOMPLETE][309] ([i915#10553])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk3/igt@kms_pm_rpm@system-suspend-modeset.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#6524])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#6524] / [i915#6805])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#9808])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#11520]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#11520]) +18 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#11520]) +8 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#11520]) +12 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][317] ([i915#11520]) +16 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#12316]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#11520])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#11520]) +5 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#9683])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#9683])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +19 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#9732]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-1/igt@kms_psr@fbc-psr-sprite-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#9688]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#1072] / [i915#9732]) +18 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-basic:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9732]) +22 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][328] +481 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +23 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#5289])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#5289])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12755] / [i915#5190])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#5289])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#5289])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12755])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#3555]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][337] ([i915#13179]) +1 other test abort
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][338] ([i915#13179]) +1 other test abort
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb4/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][339] ([i915#13179]) +1 other test abort
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][340] ([i915#13179]) +1 other test abort
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk9/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][341] ([i915#13179]) +1 other test abort
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][342] -> [FAIL][343] ([i915#5465]) +2 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          [PASS][344] -> [FAIL][345] ([i915#5465]) +2 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#8623])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][347] ([i915#10959])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#8623])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][349] -> [INCOMPLETE][350] ([i915#12276])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#11920])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#9906]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#9906]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#2437])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#2437])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][358] ([i915#2437]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk1/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#2437] / [i915#9412])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#2436])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#2434])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#2435])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][363] -> [DMESG-WARN][364] ([i915#12964]) +49 other tests dmesg-warn
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@perf@polling@0-rcs0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][365] -> [FAIL][366] ([i915#4349])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8850])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#8516])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#3291] / [i915#3708])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3708] / [i915#4077]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#3291] / [i915#3708])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#3708])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-6/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#9917])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-18/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][374] ([i915#7297]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-3/igt@gem_ccs@suspend-resume.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][376] ([i915#12392] / [i915#7297]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][378] ([i915#12714] / [i915#5784]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][380] ([i915#11713]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-6/igt@gem_exec_big@single.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][382] ([i915#10729]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         [SKIP][384] ([i915#4270]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-3/igt@gem_pxp@create-valid-protected-context.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-mtlp:         [ABORT][386] ([i915#13193]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-mtlp-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-mtlp-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][388] -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [INCOMPLETE][390] -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk5/igt@gem_workarounds@suspend-resume.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][392] ([i915#9820]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-dg1:          [FAIL][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-18/igt@i915_pm_rps@reset.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-13/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][396] ([i915#13010]) -> [PASS][397] +2 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-tglu-10/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][398] ([i915#3555]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-8/igt@kms_color@deep-color.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-10/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-snb:          [INCOMPLETE][400] -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb4/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][402] ([i915#2346]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][404] ([i915#11989]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-dg1:          [DMESG-WARN][406] ([i915#4423]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg1-12/igt@kms_flip@dpms-vs-vblank-race.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg1-17/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [DMESG-WARN][408] ([i915#12964]) -> [PASS][409] +37 other tests pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [FAIL][410] ([i915#6880]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [SKIP][412] -> [PASS][413] +5 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [INCOMPLETE][414] ([i915#13026]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][416] ([i915#9519]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][418] ([i915#9519]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][420] ([i915#12916]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][422] ([i915#4349]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][424] ([i915#13341]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-glk9/igt@perf_pmu@rc6-suspend.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-glk6/igt@perf_pmu@rc6-suspend.html
    - shard-rkl:          [DMESG-FAIL][426] ([i915#12964]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-5/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [TIMEOUT][428] ([i915#12917] / [i915#12964]) -> [SKIP][429] ([i915#4270])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          [SKIP][430] ([i915#4270]) -> [TIMEOUT][431] ([i915#12917] / [i915#12964])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][432] ([i915#10887] / [i915#12817] / [i915#9820]) -> [ABORT][433] ([i915#12817] / [i915#9820])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15843/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12314/index.html
