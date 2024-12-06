Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F10AE77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 10:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF46F10F093;
	Fri,  6 Dec 2024 10:23:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D01310F093;
 Fri,  6 Dec 2024 10:23:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe=5Fexec=5Fsip=3A?=
 =?utf-8?q?_increase_timeout_margin_for_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 10:23:01 -0000
Message-ID: <173348058137.3299059.4712180727830942608@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
In-Reply-To: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
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

Series: tests/xe_exec_sip: increase timeout margin for tests (rev2)
URL   : https://patchwork.freedesktop.org/series/139889/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15800_full -> IGTPW_12264_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12264_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12264_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12264_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk2/igt@gem_workarounds@suspend-resume-context.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15800_full and IGTPW_12264_full:

### New IGT tests (2) ###

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [1.42] s

  

Known issues
------------

  Here are the changes found in IGTPW_12264_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414]) +9 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-6/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +10 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-10/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#3936])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-1/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#3936])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@gem_busy@semaphore.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#6335])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][14] ([i915#11980] / [i915#12580])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][15] ([i915#11980] / [i915#12580])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][16] ([i915#11980] / [i915#12580])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][17] ([i915#11980] / [i915#12580])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-3/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][18] ([i915#11980] / [i915#12580])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#280]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][25] ([i915#13197])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][26] ([i915#8898])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb4/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-tglu-1:       NOTRUN -> [ABORT][27] ([i915#13218]) +1 other test abort
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [ABORT][28] ([i915#13218]) +27 other tests abort
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#4525]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#4525]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][35] +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#3281]) +11 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#3281]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +10 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4537] / [i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#4613]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4613]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#12193])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4565])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#284])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#284])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#284])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#284])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-9/igt@gem_media_vme.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4083]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-wc:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4077]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@gem_mmap_gtt@basic-wc.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4077]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4077]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4083]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4083]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3282]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][60] ([i915#2658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@gem_pread@exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3282]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][62] ([i915#2658]) +1 other test warn
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb4/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][63] ([i915#2658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3282]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][66] ([i915#12964])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4270])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][68] ([i915#12917] / [i915#12964]) +1 other test timeout
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#5190] / [i915#8428]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#8428])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#8411])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][73] ([i915#13263])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [ABORT][74] ([i915#13263])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk4/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3297]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#3297]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3297]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3297]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#2527]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#2856]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-6/igt@gen9_exec_parse@unaligned-jump.html
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2856]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#11681] / [i915#6621])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#11681] / [i915#6621])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#6188])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#6188])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-10/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][89] ([i915#4817])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#8709]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#8709]) +7 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#8709]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#10333])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4538] / [i915#5286]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#5286]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#5286]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#5286])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4538] / [i915#5190]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4538]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][103] +14 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#12313])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#12313]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#12313]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#12313]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#12313]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#12805])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#12805])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#12805])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#12805])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#12805])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#6095]) +14 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6095]) +42 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#10307] / [i915#6095]) +33 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#6095]) +34 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#6095]) +56 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#6095]) +34 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3742])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3742])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#3742])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4087]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4087]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#7828]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#7828]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#7828]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#7828]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#7828]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6944] / [i915#9424])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-6/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#9424])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-10/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#9424])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#9424])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#3299]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3116]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3299]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3116] / [i915#3299]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#3299]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6944] / [i915#9424]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#7118])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-11/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#7118])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#7116])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#6944])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#13049])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#13049])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#13049])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#13049])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#13049])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8814]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3555]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3555] / [i915#8814])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3555]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3555]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3555]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-pwrite:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][155] ([i915#12964]) +14 other tests dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_draw_crc@draw-method-pwrite.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3555] / [i915#3840])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#3840]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-5/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#3555] / [i915#3840]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#3555] / [i915#3840] / [i915#9159])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3555] / [i915#3840])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#3840])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#3637]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#9934]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#9934]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3637]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#9934]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          NOTRUN -> [ABORT][167] ([i915#13242]) +8 other tests abort
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-mtlp:         NOTRUN -> [FAIL][168] ([i915#11989]) +2 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][169] ([i915#11989]) +1 other test fail
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#2672] / [i915#3555]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#2672] / [i915#3555])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#2672] / [i915#3555]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#2672]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#2587] / [i915#2672])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#2587] / [i915#2672]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#2587] / [i915#2672] / [i915#3555])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#2672] / [i915#8813]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#2672]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#2587] / [i915#2672])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#5274])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#1825]) +18 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#1825]) +28 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3458]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][186] +19 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#8708]) +11 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3023]) +17 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3458]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][190] +168 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#8708]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5354]) +19 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][193] +321 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][194] +46 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#8708]) +12 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#12394])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#6301])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-6/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#6301])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-10/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#6301])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#6301])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#12247]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#12247] / [i915#9423])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#12247]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#12247]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#12247]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#12247]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#12247] / [i915#3555] / [i915#6953])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#5354]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3828])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3828])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3828])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-17/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#9340])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3828]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#9340])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3828]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-9/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6524] / [i915#6805])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#6524])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#6524])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6524])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#6524])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#11520]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][222] ([i915#11520]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#9808])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#11520]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][225] ([i915#11520]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#12316]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#11520]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-11/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#11520]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#4348]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#9683])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-5/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9683]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9683]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#9683]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9732]) +13 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#9688]) +11 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#1072] / [i915#9732]) +19 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#9732]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-1/igt@kms_psr@psr-cursor-blt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#1072] / [i915#9732]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-3/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#1072] / [i915#9732]) +13 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#4077] / [i915#9688]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-2/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#5289]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#5289]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-14/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#5289]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#12755])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#12755])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8809])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#11920])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#9906])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-12/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9906])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-2/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#8808] / [i915#9906])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-3/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#9906])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-3/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#9906])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@kms_vrr@max-min.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglu:         NOTRUN -> [ABORT][253] ([i915#13218]) +32 other tests abort
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-tglu-2/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          NOTRUN -> [ABORT][254] ([i915#13218]) +24 other tests abort
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-glk3/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          NOTRUN -> [ABORT][255] ([i915#13218]) +24 other tests abort
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-3/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@non-system-wide-paranoid:
    - shard-mtlp:         NOTRUN -> [ABORT][256] ([i915#13218]) +28 other tests abort
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-8/igt@perf@non-system-wide-paranoid.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][257] ([i915#13218]) +20 other tests abort
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-snb5/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          NOTRUN -> [ABORT][258] ([i915#13218]) +27 other tests abort
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@perf_pmu@semaphore-wait.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][259] ([i915#9351])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][260] ([i915#9351])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#3708]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#3708]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-1/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#3708]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-dg1-18/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#3708])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@stress-mm:
    - shard-rkl:          [DMESG-WARN][265] ([i915#12964]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-rkl-5/igt@gem_userptr_blits@stress-mm.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-3/igt@gem_userptr_blits@stress-mm.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-rkl:          [SKIP][267] -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15800/shard-rkl-5/igt@i915_pm_rpm@sysfs-read.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/shard-rkl-5/igt@i915_pm_rpm@sysfs-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13197
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#13263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13263
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8141 -> IGTPW_12264
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15800: 2e90353f058f2487798ad9236f0926df4ea54f02 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12264: 60a3c62fe2c882953d9a9f1da6d66a3c0c9c1baf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12264/index.html
