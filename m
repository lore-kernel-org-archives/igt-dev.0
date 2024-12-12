Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC083E77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 03:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8544F10ECA4;
	Thu, 12 Dec 2024 03:06:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C17F10E0C1;
 Thu, 12 Dec 2024 03:06:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2C1/2=5D_tests/xe=5Feudebug=3A_Set_NEEDS=5FVISIBLE=5FVRAM_f?=
 =?utf-8?q?or_=27create=5Fbind=5Flist=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 03:06:46 -0000
Message-ID: <173397280662.1408186.224478262264377282@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
In-Reply-To: <20241211191741.36973-1-christoph.manszewski@intel.com>
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

Series: series starting with [i-g-t,1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for 'create_bind_list'
URL   : https://patchwork.freedesktop.org/series/142438/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15825_full -> IGTPW_12298_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12298_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12298_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12298_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-8/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@gem_eio@kms.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-rkl:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-2/igt@i915_pm_rpm@gem-pread.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-5/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][9] +2 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk3/igt@kms_async_flips@crc-atomic.html
    - shard-dg2:          NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][11] +3 other tests crash
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@kms_async_flips@crc@pipe-a-dp-4.html

  * igt@kms_pm_backlight@brightness-with-dpms@edp-1:
    - shard-mtlp:         NOTRUN -> [ABORT][13] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-3/igt@kms_pm_backlight@brightness-with-dpms@edp-1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-tglu:         NOTRUN -> [ABORT][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@perf_pmu@rc6-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_busy@extended-modeset-hang-oldfb:
    - {shard-dg2-9}:      [PASS][15] -> [ABORT][16] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-9/igt@kms_busy@extended-modeset-hang-oldfb.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-9/igt@kms_busy@extended-modeset-hang-oldfb.html

  
Known issues
------------

  Here are the changes found in IGTPW_12298_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8411]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         NOTRUN -> [ABORT][19] ([i915#12817] / [i915#5507])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@device_reset@unbind-reset-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][20] ([i915#12964]) +20 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +9 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#8562])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8562])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][35] ([i915#11980] / [i915#12580])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#5882]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][37] ([i915#1099]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#280]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][41] -> [ABORT][42] ([i915#10030] / [i915#7975] / [i915#8213])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-tglu-8/igt@gem_eio@hibernate.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#8555]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8555])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4525]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4525]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#4525]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][49] ([i915#6334]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#6344])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#6344])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3281]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3281]) +15 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3281]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +13 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#2190])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#4613] / [i915#7582])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4613])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4613]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#4613]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#284])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@gem_media_vme.html
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#284])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4077]) +17 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4077]) +13 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][77] -> [ABORT][78] ([i915#10729]) +1 other test abort
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4083]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4083]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3282]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3282]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][84] ([i915#2658])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][85] ([i915#12964]) +1 other test timeout
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][88] ([i915#12917] / [i915#12964]) +1 other test timeout
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#13033])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#13033])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglu:         [PASS][91] -> [SKIP][92] ([i915#4270])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-tglu-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#4270])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#3282])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-2/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#8428]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4079]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#3297] / [i915#3323])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3297]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3282] / [i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297] / [i915#4880])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#3297]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3281] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297] / [i915#4958])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#4958])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3297]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#2856]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@gen9_exec_parse@allowed-all.html
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#2856]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#2527]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][115] -> [ABORT][116] ([i915#9820])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#8399]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4077]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][120] ([i915#12797])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk9/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-3/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#11681] / [i915#6621])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#11681])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#6245])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][125] -> [DMESG-FAIL][126] ([i915#12964])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-5/igt@i915_selftest@live.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [PASS][127] -> [ABORT][128] ([i915#13010]) +1 other test abort
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-tglu-9/igt@i915_selftest@live@sanitycheck.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][129] -> [ABORT][130] ([i915#12061]) +1 other test abort
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][131] ([i915#1982] / [i915#9311])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk8/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][132] ([i915#9311]) +1 other test dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@i915_selftest@mock@memory_region.html
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][133] ([i915#9311]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][134] ([i915#9311])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk8/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [PASS][135] -> [INCOMPLETE][136] ([i915#4817])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-glk7/igt@i915_suspend@basic-s3-without-i915.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#4817])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk3/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#4212]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4212])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#5190]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#4212]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#8709]) +15 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#8709]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#8709]) +23 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][145] ([i915#13287])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][146] ([i915#13287]) +3 other tests crash
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#1769] / [i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][148] ([i915#1769])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][149] ([i915#1769])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5286]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#5286]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#5286]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#5286]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][154] +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3638]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][156] +13 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3638]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#6187])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#4538] / [i915#5190]) +13 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4538]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#12313]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6095]) +54 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#6095]) +199 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#12313]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#12313])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#10307] / [i915#6095]) +191 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6095]) +24 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#6095]) +121 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#12805])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#6095]) +17 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#6095]) +44 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#12313])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#12313]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3742])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7213]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4087]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#7828]) +8 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@kms_chamelium_audio@dp-audio-edid.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#7828]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][180] +46 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#7828]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#7828]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#7828]) +9 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#7828]) +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7118] / [i915#9424])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#9424])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3116] / [i915#3299])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3299])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3299])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3116])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#3116] / [i915#3299])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3299])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9424]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#6944] / [i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#6944] / [i915#9424])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#6944] / [i915#7116] / [i915#7118])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#7116])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#13049])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#3555]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8814])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#13049]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#13049]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#9809])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4103] / [i915#4213]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#4103] / [i915#4213]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#4103]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#13046] / [i915#5354]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#9067])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#4213])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#4103])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#4103])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#9833])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#8588])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#1257])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#1257])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#1257])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#1257])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][221] -> [SKIP][222] ([i915#12402])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#12402])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#8812])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#8812])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#3555] / [i915#3840]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555] / [i915#3840])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#3840]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3555] / [i915#3840]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3955])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#3469])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#3469])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#1839])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1839])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_feature_discovery@display-4x.html
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#1839]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#1839])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9337])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#658])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#4881])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#4881])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9934]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][242] -> [FAIL][243] ([i915#13027]) +1 other test fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#8381]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#8381]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3637]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#9934]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#3637]) +9 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#9934]) +8 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#3637]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [PASS][251] -> [FAIL][252] ([i915#11989])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][253] ([i915#11989]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-snb:          [PASS][254] -> [FAIL][255] ([i915#11989]) +3 other tests fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][256] -> [FAIL][257] ([i915#11989]) +1 other test fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-tglu-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8381]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8810]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#2672]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#2587] / [i915#2672] / [i915#3555])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#2587] / [i915#2672]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#2672] / [i915#8813])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2672]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [PASS][275] -> [DMESG-WARN][276] ([i915#12964]) +48 other tests dmesg-warn
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8708]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#5354]) +31 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#1825]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-snb:          [PASS][280] -> [SKIP][281] +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#5439])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#3023]) +23 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#10433] / [i915#3458])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] +50 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#8708]) +16 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#5439])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#10055])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#9766])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][290] +68 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#8708]) +19 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#1825]) +41 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#3458]) +15 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#3458]) +25 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#3555] / [i915#8228])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][296] -> [SKIP][297] ([i915#3555] / [i915#8228])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8228]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#10656])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#12388])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#10656])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#10656])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#12394])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#6301])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#6301])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][308] ([i915#12756] / [i915#1982]) +1 other test incomplete
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][309] ([i915#13026]) +1 other test incomplete
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][310] ([i915#12177])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][311] ([i915#10647]) +1 other test fail
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][312] ([i915#12917] / [i915#12964])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#3555]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-4/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#3555] / [i915#8821])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#12247] / [i915#9423])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12247]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#12247]) +18 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#12247]) +8 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#6953])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12247]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg1:          [PASS][321] -> [DMESG-WARN][322] ([i915#4423]) +3 other tests dmesg-warn
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#12247] / [i915#3555])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#12247] / [i915#3555])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#12247]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#5354])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#5354])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9812])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12343])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#12343])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12343])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9812])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#9685])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#9685]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#9685])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#3361])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#3828])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][338] -> [SKIP][339] ([i915#9519])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#9519])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9519])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#9519])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#9519])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#6524] / [i915#6805])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#6524]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#6524])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#12316]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#11520]) +8 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-13/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][351] ([i915#11520]) +12 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#11520]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#11520]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([i915#11520]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#11520]) +7 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#11520]) +6 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#9683]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9683]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#9683])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#9683])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#1072] / [i915#9732]) +23 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#9688]) +9 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#9732]) +11 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#1072] / [i915#9732]) +25 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-2/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#9732]) +18 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-4/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#1072] / [i915#9732]) +23 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][368] +403 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#4235])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][370] ([i915#5289])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#12755]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#12755] / [i915#5190]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#12755]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#5289])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#5289]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#3555]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][377] ([i915#13179]) +1 other test abort
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][378] ([i915#13179]) +1 other test abort
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][379] ([IGT#160])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#8623])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#8623])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][382] ([i915#12276]) +1 other test incomplete
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#9906])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#11920])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-8/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#11920])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-3/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#11920])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#11920])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-10/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#11920])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3555] / [i915#9906])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#3555] / [i915#9906])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-4/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#9906])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][392] ([i915#2437]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-glk3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#2437] / [i915#9412])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#2437] / [i915#9412])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][395] ([i915#2437] / [i915#9412]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#2437] / [i915#9412])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#2437] / [i915#9412])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][398] ([i915#7387])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-7/igt@perf@global-sseu-config.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#7387])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-7/igt@perf@global-sseu-config-invalid.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][400] +413 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb1/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-idle@ccs0:
    - shard-mtlp:         [PASS][401] -> [FAIL][402] ([i915#4349]) +1 other test fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-7/igt@perf_pmu@busy-idle@ccs0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-8/igt@perf_pmu@busy-idle@ccs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#8850])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#8850])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][405] -> [FAIL][406] ([i915#4349]) +1 other test fail
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][407] ([i915#8516])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#3291] / [i915#3708])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#9917]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-8/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][410] ([i915#12910]) +18 other tests fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-tglu-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#9917])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#9917])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][413] ([i915#12910]) +8 other tests fail
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][414] +18 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][415] ([i915#4818])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-17/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#4818])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-8/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#4818])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         [ABORT][418] -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_off.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-4/igt@debugfs_test@read_all_entries_display_off.html

  * igt@gem_create@busy-create@smem0:
    - shard-dg2:          [INCOMPLETE][420] -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-2/igt@gem_create@busy-create@smem0.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-10/igt@gem_create@busy-create@smem0.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][422] ([i915#9561]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg2-4/igt@gem_ctx_freq@sysfs.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg2-1/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][424] ([i915#7975] / [i915#8213]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-dg1-14/igt@gem_eio@hibernate.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-dg1-18/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-mtlp:         [INCOMPLETE][426] -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-mtlp-5/igt@gem_eio@unwedge-stress.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-mtlp-5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_await@wide-all:
    - shard-snb:          [INCOMPLETE][428] -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15825/shard-snb5/igt@gem_exec_await@wide-all.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/shard-snb7/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12298/index.html
