Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148E8E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 14:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F0710F00E;
	Fri, 13 Dec 2024 14:01:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC94610E43C;
 Fri, 13 Dec 2024 14:01:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe=5Fspin=5Fbatch?=
 =?utf-8?q?=3A_Add_spin-timestamp-check_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 14:01:32 -0000
Message-ID: <173409849288.2161506.12885111490990091763@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213083730.642423-1-pravalika.gurram@intel.com>
In-Reply-To: <20241213083730.642423-1-pravalika.gurram@intel.com>
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

Series: tests/xe_spin_batch: Add spin-timestamp-check (rev9)
URL   : https://patchwork.freedesktop.org/series/140933/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15836_full -> IGTPW_12311_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12311_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12311_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12311_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg1:          NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_async_flips@crc-atomic.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][4] +3 other tests crash
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12311_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#9318])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +19 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#3281]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#3936])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#3936])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-9/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#13008])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#6335])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#6335])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8562])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#1099]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb4/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][27] ([i915#11980] / [i915#12580])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][28] ([i915#11980] / [i915#12580])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][29] ([i915#11980] / [i915#12580])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][30] ([i915#11980] / [i915#12580])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][31] ([i915#11980] / [i915#12580])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@create-ext:
    - shard-mtlp:         [PASS][36] -> [ABORT][37] ([i915#13193])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-5/igt@gem_eio@create-ext.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@gem_eio@create-ext.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][38] -> [ABORT][39] ([i915#10030] / [i915#7975] / [i915#8213])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@gem_eio@hibernate.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-6/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][40] ([i915#7975] / [i915#8213])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][41] ([i915#8898])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb4/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][42] -> [FAIL][43] ([i915#12714] / [i915#5784])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4771])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4525]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#4525])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#4525])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#6334]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#6334]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#6344])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +15 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +10 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3281])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4860]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4860]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613] / [i915#7582])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +11 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4077]) +16 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-2/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][75] ([i915#2658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3282]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-6/igt@gem_pxp@create-valid-protected-context.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][79] ([i915#12964])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#13033])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][81] ([i915#12917] / [i915#12964])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-snb:          NOTRUN -> [SKIP][82] +383 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb1/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#5190] / [i915#8428]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4079])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#8411]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3282] / [i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][96] ([i915#12964])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          NOTRUN -> [ABORT][102] ([i915#9820])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#8399])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#6590]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][106] ([i915#2681]) +4 other tests warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#11681] / [i915#6621])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#11681] / [i915#6621])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][109] ([i915#9311]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb5/igt@i915_selftest@mock.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][110] ([i915#4817])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk8/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#7707])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4215])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#4212])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4212]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-tglu:         NOTRUN -> [FAIL][116] ([i915#13320])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [PASS][117] -> [INCOMPLETE][118] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#8709]) +15 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#8709]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][122] ([i915#13287] / [i915#9878])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][123] ([i915#13287])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][124] ([i915#13287])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#9531])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][128] +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#5286]) +9 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#5286])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#5286]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5286]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#5286]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3638])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#3638]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#5190])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5190]) +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#6095]) +169 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#6095]) +174 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +89 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][142] +425 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#12313]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#12805])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#6095]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6095]) +39 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][147] ([i915#12796])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#6095]) +99 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#12313]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6095]) +9 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#7828]) +9 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@gamma:
    - shard-mtlp:         NOTRUN -> [SKIP][154] +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#7828]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#7828]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#7828]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7828]) +11 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#7828])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3555] / [i915#9979])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][163] ([i915#7173])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#3299])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3116] / [i915#3299])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#6944] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118] / [i915#9424]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#7116] / [i915#9424]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7118] / [i915#9424]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_content_protection@uevent.html
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3555]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#8814])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#13049])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#13049]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#13049]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#13049]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#13049]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#3555])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#13046] / [i915#5354]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#4103]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#4103] / [i915#4213]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][187] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][188] +32 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#9067])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#4103]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9833])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9723])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#3555]) +8 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8812])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#8812])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3555] / [i915#3840])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3555] / [i915#3840])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3840] / [i915#9053])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3955])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#1839])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#1839])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#1839])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#9337])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#9337])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#658])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#658])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#658])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#4881])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3637]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3637])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#9934]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#9934]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#3637]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#8381])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8381])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#9934]) +7 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          [PASS][220] -> [FAIL][221] ([i915#11989]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][222] -> [DMESG-WARN][223] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
    - shard-rkl:          [PASS][224] -> [DMESG-WARN][225] ([i915#12964]) +21 other tests dmesg-warn
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-4/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][226] ([i915#12964]) +10 other tests dmesg-warn
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][227] ([i915#13027]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#12745]) +1 other test incomplete
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:
    - shard-tglu:         [PASS][230] -> [FAIL][231] ([i915#11989]) +5 other tests fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [PASS][232] -> [FAIL][233] ([i915#11989]) +1 other test fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][234] ([i915#11989]) +3 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][235] ([i915#11989]) +2 other tests fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk5/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555]) +7 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#2672]) +7 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672] / [i915#3555])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#2587] / [i915#2672])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          [PASS][246] -> [FAIL][247] ([i915#6880]) +2 other tests fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#5354]) +30 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][249] +42 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#5439])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#3458]) +14 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#3458]) +14 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] +36 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3023]) +33 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#5439])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][256] +88 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#8708]) +19 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8708]) +14 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#1825]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#1825]) +44 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8228])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#12713])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8228])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8228]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#12339])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#10656])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#12339])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#12339])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#4816])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#6301])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][273] ([i915#13026]) +1 other test incomplete
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][274] ([i915#12169]) +1 other test fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][275] ([i915#10647]) +3 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#12247]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12247]) +12 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#12247]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12247]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#12247]) +13 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#12247] / [i915#6953]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#12247] / [i915#3555])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#3555])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12247] / [i915#6953])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#9812])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#9685]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#3828])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#5978])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#3361])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#9340])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#9340])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#9340])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#8430])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [PASS][295] -> [SKIP][296] ([i915#12916])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][297] -> [SKIP][298] ([i915#9519])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][299] -> [SKIP][300] ([i915#9519]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#9519]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#9519]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#6524])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#11520]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][307] ([i915#11520]) +14 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#11520]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#11520]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#11520]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][311] ([i915#11520]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#11520]) +6 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#9683])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#9688]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-5/igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#1072] / [i915#9732]) +19 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#9732]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +17 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9732]) +22 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#1072] / [i915#9732]) +29 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#9685])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#9685]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#9685])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#9685]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12755]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12755])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#5289])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#5289])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#5289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#3555]) +7 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][330] ([i915#13179]) +1 other test abort
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][331] ([i915#13179]) +1 other test abort
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb2/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][332] ([i915#13179]) +1 other test abort
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-10/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][333] ([i915#13179]) +1 other test abort
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][334] ([i915#13179]) +1 other test abort
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][335] ([i915#13179]) +1 other test abort
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][336] ([IGT#160])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-7/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][337] ([IGT#160] / [i915#6493])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#8623]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#8623])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][340] ([i915#12276]) +1 other test incomplete
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][341] -> [INCOMPLETE][342] ([i915#12276])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#3555] / [i915#9906])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#9906])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#2437])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#2437])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#2437] / [i915#9412])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][348] ([i915#2437])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#2437] / [i915#9412])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#2437] / [i915#9412])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#2437] / [i915#9412])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-mtlp:         [PASS][352] -> [FAIL][353] ([i915#10538])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#7387])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@perf@global-sseu-config-invalid.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#2435])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#8850])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][357] -> [FAIL][358] ([i915#4349]) +1 other test fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#8516])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#3708] / [i915#4077])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3708] / [i915#4077])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-18/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#3708])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#3708])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-2/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#3708]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#3708])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#9917]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][367] ([i915#12910]) +28 other tests fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#9917])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-14/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][369] ([i915#12910]) +8 other tests fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#4818])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-17/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][371] ([i915#9820]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][373] ([i915#9820]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][375] ([i915#12797]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][377] ([i915#4817]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-rkl:          [DMESG-WARN][379] ([i915#12964]) -> [PASS][380] +21 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@kms_addfb_basic@bo-too-small.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [FAIL][381] ([i915#10991]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][383] ([i915#5956]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][385] ([i915#5956]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [FAIL][387] ([i915#2346]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [FAIL][389] ([i915#11989] / [i915#12840]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [FAIL][391] ([i915#11989]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [FAIL][393] ([i915#6880]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-snb:          [SKIP][395] -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][397] ([i915#3555] / [i915#8228]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-2/igt@kms_hdr@invalid-metadata-sizes.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-rkl:          [DMESG-WARN][399] ([i915#12917] / [i915#12964]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][401] ([i915#9519]) -> [PASS][402] +1 other test pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-rkl:          [SKIP][403] ([i915#9519]) -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg1:          [DMESG-WARN][405] ([i915#4423]) -> [PASS][406] +2 other tests pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-12/igt@kms_rotation_crc@bad-pixel-format.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][407] ([i915#4349]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [ABORT][409] ([i915#13010]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-5/igt@perf_pmu@module-unload.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [FAIL][411] ([i915#4349]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-1/igt@perf_pmu@most-busy-check-all.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [FAIL][413] ([i915#13104]) -> [TIMEOUT][414] ([i915#12917] / [i915#12964])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [SKIP][415] ([i915#4270]) -> [TIMEOUT][416] ([i915#12917] / [i915#12964])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][417] ([i915#12917] / [i915#12964]) -> [SKIP][418] ([i915#4270])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][419] ([i915#12817] / [i915#13010] / [i915#9820]) -> [ABORT][420] ([i915#12817] / [i915#9820])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][421] ([i915#10131] / [i915#10887]) -> [ABORT][422] ([i915#10131] / [i915#10887] / [i915#9820])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][423] ([i915#12964]) -> [DMESG-FAIL][424] ([i915#12964] / [i915#13342])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@i915_selftest@live.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-rkl-7/igt@i915_selftest@live.html

  * igt@kms_async_flips@crc:
    - shard-glk:          [INCOMPLETE][425] ([i915#13287] / [i915#9878]) -> [INCOMPLETE][426] ([i915#9878])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@crc.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk3/igt@kms_async_flips@crc.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [SKIP][427] ([i915#7118] / [i915#9424]) -> [TIMEOUT][428] ([i915#7173])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-2/igt@kms_content_protection@atomic.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg2-10/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          [SKIP][429] ([i915#13049] / [i915#4423]) -> [SKIP][430] ([i915#13049])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x170.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][431] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][432] ([i915#12745] / [i915#1982] / [i915#4839])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk7/igt@kms_flip@2x-flip-vs-suspend.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][433] ([i915#4839]) -

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12311/index.html
