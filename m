Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C17E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32AC10E2EB;
	Thu, 12 Dec 2024 17:18:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359C10E0E8;
 Thu, 12 Dec 2024 17:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Fix_dist_building_with_i?=
 =?utf-8?q?ga64_codes_script?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 17:18:47 -0000
Message-ID: <173402392733.1666436.10629882087228347120@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
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

Series: Fix dist building with iga64 codes script
URL   : https://patchwork.freedesktop.org/series/142473/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15830_full -> IGTPW_12305_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12305_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12305_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12305_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@gem_eio@in-flight-suspend.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][4] +3 other tests crash
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_pm_rpm@cursor:
    - shard-rkl:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-1/igt@kms_pm_rpm@cursor.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_pm_rpm@cursor.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][8] ([i915#13273]) -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk2/igt@gem_workarounds@suspend-resume-context.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@gem_workarounds@suspend-resume-context.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-rkl:          [DMESG-WARN][10] ([i915#12964]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-4/igt@perf_pmu@rc6@runtime-pm-long-gt0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  
Known issues
------------

  Here are the changes found in IGTPW_12305_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#6230])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#6230])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][16] -> [ABORT][17] ([i915#5507])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8414]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@memory-info-resident:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][19] ([i915#12964]) +26 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@drm_fdinfo@memory-info-resident.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#4873])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-8/igt@gem_caching@reads.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#13008])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#13008])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][29] ([i915#7297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][31] ([i915#12392] / [i915#7297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#7697]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#6335])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#6335])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#8562])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][39] ([i915#1099]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          NOTRUN -> [FAIL][42] ([i915#11980] / [i915#12580])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][43] ([i915#11980] / [i915#12580])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#280]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][47] -> [ABORT][48] ([i915#10030] / [i915#7975] / [i915#8213])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-3/igt@gem_eio@hibernate.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#4525]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4525])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#6334]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3281])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3281]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3281]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3281]) +20 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4812]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4077])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-5/igt@gem_mmap_gtt@big-bo.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4077]) +14 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@gem_mmap_wc@bad-object.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4083])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4083]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3282]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4270])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12964]) +1 other test timeout
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][85] ([i915#13263])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3297]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297] / [i915#4958])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][92] +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +6 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#2527]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][99] ([i915#12817] / [i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#6412])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][101] +21 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][102] ([i915#2681]) +4 other tests warn
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][103] -> [FAIL][104] ([i915#12739] / [i915#3591])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#11681] / [i915#6621])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#11681] / [i915#6621])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#11681]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#11681])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4387])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#7984])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#6245])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][112] ([i915#9311]) +1 other test dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb4/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][113] ([i915#9311]) +1 other test dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk8/igt@i915_selftest@mock.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][114] -> [ABORT][115] ([i915#13010]) +2 other tests abort
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-10/igt@i915_selftest@perf.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@i915_selftest@perf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][116] -> [INCOMPLETE][117] ([i915#4817])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk5/igt@i915_suspend@fence-restore-tiled2untiled.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#7707])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4212])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@unused-modifier:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][120] ([i915#4423]) +2 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_addfb_basic@unused-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-rkl:          [PASS][121] -> [DMESG-WARN][122] ([i915#12964]) +32 other tests dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#6228])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#9531])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#1769] / [i915#3555]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][129] ([i915#1769])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#1769] / [i915#3555])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][131] ([i915#1769])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#5286]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#5286]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#5286]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4423] / [i915#4538] / [i915#5286])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5286]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3638]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5190]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3638]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][141] +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#6095]) +131 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#6095]) +101 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +69 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#12313]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6095]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#12805])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#6095]) +19 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#12313]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#12313]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#6095]) +174 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +19 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#7213] / [i915#9010]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-8/igt@kms_cdclk@mode-transition.html
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#11616] / [i915#7213])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3742])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3742]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7213]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3742]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4087]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#7828]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-8/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7828]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7828]) +12 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828]) +15 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#7828]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3116] / [i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3116]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7116] / [i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#7118] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#13049]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#13049])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#3555]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#13049]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#13049])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3555]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3555]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][187] ([i915#12964]) +1 other test dmesg-fail
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#13046] / [i915#5354]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#4103]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#4103]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#9809])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [PASS][193] -> [FAIL][194] ([i915#2346])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#4103] / [i915#4213])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][196] ([i915#12170])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][197] ([i915#11968])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#1257])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3840])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3469])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3955])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3469])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#1839])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#1839])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#1839] / [i915#4423])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#9337])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#658])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_feature_discovery@psr1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#658])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#4881]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3637]) +14 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#9934]) +8 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8381])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3637])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9934]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#3637]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9934]) +8 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][221] ([i915#12745] / [i915#4839])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][222] ([i915#12745])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-snb:          [PASS][223] -> [FAIL][224] ([i915#11989]) +1 other test fail
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb5/igt@kms_flip@plain-flip-ts-check.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb1/igt@kms_flip@plain-flip-ts-check.html
    - shard-tglu:         NOTRUN -> [FAIL][225] ([i915#11989]) +2 other tests fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2587] / [i915#2672]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555] / [i915#8813])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#2672] / [i915#8813])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#2672]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#2587] / [i915#2672] / [i915#3555])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2587] / [i915#2672] / [i915#3555])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8813])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#8810])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672]) +7 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +10 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#2672]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][243] -> [FAIL][244] ([i915#6880]) +2 other tests fail
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#8708]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8708]) +10 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#1825]) +53 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][248] -> [SKIP][249] +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#3458] / [i915#4423])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] +33 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#1825]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][253] +49 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3023]) +34 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#5439])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][256] +107 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#8708]) +22 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3458]) +11 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#4423]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#5354]) +21 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3458]) +17 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][262] -> [SKIP][263] ([i915#13012] / [i915#13030])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8228]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8228]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#12713])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12713])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#10656])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12388])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#10656])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#10656])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#12388]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#12339])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#4070] / [i915#4816])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][277] -> [INCOMPLETE][278] ([i915#12756])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#13026]) +1 other test incomplete
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#11614] / [i915#3582]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#9423])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12247]) +11 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12247]) +19 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#12247]) +14 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#6953] / [i915#9423])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#6953])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#12247]) +12 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#12247]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#12247] / [i915#3555] / [i915#9423])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12247] / [i915#3555])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12343])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3828])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#3361])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#9340])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#9519]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][300] -> [SKIP][301] ([i915#9519])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#9519])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#6524])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#11520]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#12316])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#11520]) +8 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#11520]) +12 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][310] ([i915#11520]) +8 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#11520]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#11520]) +4 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][313] ([i915#11520]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#9683])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9683])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9683]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +32 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#9688]) +6 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-3/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#9732]) +8 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9732]) +29 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-8/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#1072] / [i915#4423] / [i915#9732]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +16 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +23 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][324] +333 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk9/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#9685]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#5289])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#12755])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#5289]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12755] / [i915#5190])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#5289]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][331] ([IGT#160])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#8623]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#8623])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][334] -> [INCOMPLETE][335] ([i915#12276])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3:
    - shard-dg1:          [PASS][336] -> [DMESG-WARN][337] ([i915#4423]) +4 other tests dmesg-warn
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][338] ([i915#12276])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#9906])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9906])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9906]) +3 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#2437])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#2437])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-10/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][344] ([i915#2437])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#2437])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-5/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#2437])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#7387])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][348] +492 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb7/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][349] ([i915#12549] / [i915#6806]) +1 other test fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@perf_pmu@frequency@gt0.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#9917]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][351] ([i915#12910])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#9917])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-tglu:         [ABORT][353] ([i915#12817]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-3/igt@gem_exec_suspend@basic-s0@smem.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][355] ([i915#12942]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][357] ([i915#12739] / [i915#3591]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [DMESG-FAIL][359] ([i915#13264]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb1/igt@i915_pm_rps@reset.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][361] ([i915#13010]) -> [PASS][362] +1 other test pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][363] ([i915#4817]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk8/igt@i915_suspend@debugfs-reader.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][365] -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][367] ([i915#5956]) -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-17/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][369] ([i915#5138]) -> [PASS][370] +1 other test pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-glk:          [FAIL][371] ([i915#2346]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [FAIL][373] ([i915#4767]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          [FAIL][375] ([i915#11989]) -> [PASS][376] +1 other test pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - shard-snb:          [DMESG-WARN][377] ([i915#12901]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb5/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb7/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [DMESG-WARN][379] ([i915#12964]) -> [PASS][380] +33 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-snb:          [SKIP][381] -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][383] ([i915#9519]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][385] ([i915#9519]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [INCOMPLETE][387] ([i915#10553]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk1/igt@kms_pm_rpm@system-suspend-modeset.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][389] ([i915#12276]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][391] ([i915#3555] / [i915#9906]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-4/igt@kms_vrr@negative-basic.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-10/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-dg2:          [FAIL][393] ([i915#4349]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-1/igt@perf_pmu@busy-double-start@vcs0.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-11/igt@perf_pmu@busy-double-start@vcs0.html

  
#### Warnings ####

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][395] ([i915#12917] / [i915#12964]) -> [SKIP][396] ([i915#4270]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-3/igt@gem_pxp@display-protected-crc.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [FAIL][397] ([i915#13109]) -> [TIMEOUT][398] ([i915#12917] / [i915#12964])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [WARN][399] ([i915#12653]) -> [ABORT][400] ([i915#9820])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg1:          [SKIP][401] ([i915#4538] / [i915#5286]) -> [SKIP][402] ([i915#4423] / [i915#4538] / [i915#5286])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          [SKIP][403] -> [SKIP][404] ([i915#4423])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-14/igt@kms_big_fb@yf-tiled-addfb.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg1:          [SKIP][405] ([i915#12313]) -> [SKIP][406] ([i915#12313] / [i915#4423])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          [SKIP][407] ([i915#12805]) -> [SKIP][408] ([i915#12805] / [i915#4423])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg1:          [SKIP][409] ([i915#4423]) -> [SKIP][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@kms_chamelium_color@ctm-0-25.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          [SKIP][411] ([i915#4423] / [i915#7828]) -> [SKIP][412] ([i915#7828])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          [SKIP][413] ([i915#7828]) -> [SKIP][414] ([i915#4423] / [i915#7828])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          [SKIP][415] ([i915#7116]) -> [SKIP][416] ([i915#4423] / [i915#7116])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-17/igt@kms_content_protection@srm.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-17/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][417] ([i915#12745] / [i915#1982] / [i915#4839]) -> [INCOMPLETE][418] ([i915#12745] / [i915#4839])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][419] ([i915#1982] / [i915#4839]) -> [INCOMPLETE][420] ([i915#4839])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][421] ([i915#3458]) -> [SKIP][422] ([i915#10433] / [i915#3458])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][423] ([i915#10433] / [i915#3458]) -> [SKIP][424] ([i915#3458])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          [SKIP][425] ([i915#8708]) -> [SKIP][426] ([i915#4423] / [i915#8708]) +2 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         [SKIP][427] ([i915#1187] / [i915#12713]) -> [SKIP][428] ([i915#12713])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][429] ([i915#9340]) -> [SKIP][430] ([i915#3828])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [DMESG-WARN][431] ([i915#12964]) -> [SKIP][432] ([i915#9519])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15830/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg1:          [SKIP][433] ([i915#11520]) -> [SKIP][434] ([i915#11520] / [i915#4423]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-t

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12305/index.html
