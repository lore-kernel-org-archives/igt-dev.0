Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E319E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 05:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884310E2F1;
	Thu, 12 Dec 2024 05:33:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2377210E2F1;
 Thu, 12 Dec 2024 05:33:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Fhistogram=3A?=
 =?utf-8?q?_Added_IGT_support_to_validate_global_histogram_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 05:33:19 -0000
Message-ID: <173398159913.1466418.711422918847282735@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20240705091333.328322-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240705091333.328322-1-mohammed.thasleem@intel.com>
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

Series: tests/kms_histogram: Added IGT support to validate global histogram (rev6)
URL   : https://patchwork.freedesktop.org/series/135789/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15826_full -> IGTPW_12300_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12300_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12300_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12300_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-3/igt@i915_pm_rpm@system-suspend-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-5/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@i915_selftest@live.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][9] +3 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_histogram@algo-basic (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-5/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_histogram@global-color.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][17] +2 other tests incomplete
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk9/igt@perf_pmu@rc6-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15826_full and IGTPW_12300_full:

### New IGT tests (4) ###

  * igt@kms_histogram@algo-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_histogram@algo-color:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_histogram@global-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_histogram@global-color:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12300_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#11078])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][21] ([i915#11814] / [i915#11815])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html
    - shard-tglu:         NOTRUN -> [ABORT][22] ([i915#12817] / [i915#5507])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8414])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8414]) +18 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8414]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][29] -> [INCOMPLETE][30] ([i915#7297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gem_ccs@suspend-resume.html
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gem_ccs@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][33] -> [INCOMPLETE][34] ([i915#12392] / [i915#7297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#6335])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#8562])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][38] ([i915#12353])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8555]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#1099]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb4/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#280])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][45] -> [ABORT][46] ([i915#10030] / [i915#7975] / [i915#8213])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-2/igt@gem_eio@hibernate.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][47] -> [FAIL][48] ([i915#12543] / [i915#5784])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-17/igt@gem_eio@reset-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#8555])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#4525]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4525]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4525])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#6334]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#6334]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#6344])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#6344])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4812])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3281]) +11 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#3281]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3281]) +9 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@gem_exec_reloc@basic-wc-read-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3281]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4812]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][66] -> [INCOMPLETE][67] ([i915#11441] / [i915#13304])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][68] -> [INCOMPLETE][69] ([i915#11441])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][70] ([i915#13196]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk9/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4860]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#2190])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4613]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4613]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([i915#4613]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4077]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4083]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@gem_mmap_wc@write-read.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4083]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][81] ([i915#2658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][82] ([i915#12964]) +1 other test timeout
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@gem_pxp@create-protected-buffer.html
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4270])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         [PASS][85] -> [SKIP][86] ([i915#4270])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-4/igt@gem_pxp@fail-invalid-protected-context.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][87] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#13033])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#13033])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3282]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-7/igt@gem_readwrite@read-bad-handle.html
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3282])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-2/igt@gem_readwrite@read-bad-handle.html
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3282])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#8428]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190] / [i915#8428]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4885])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4885])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][97] -> [INCOMPLETE][98] ([i915#13306])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-glk1/igt@gem_softpin@noreloc-s3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4077]) +15 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4079]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4879])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#3297] / [i915#3323])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3297]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#4880]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#2856]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#2856]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#2527]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][116] -> [ABORT][117] ([i915#9820])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8399])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#8399])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][120] ([i915#12455]) +1 other test incomplete
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][121] -> [FAIL][122] ([i915#12942]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#11681] / [i915#6621])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [INCOMPLETE][124] ([i915#7790])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#11681])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#6245])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][127] ([i915#9311]) +1 other test dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb7/igt@i915_selftest@mock.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][128] ([i915#9311]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-7/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][129] ([i915#9311]) +1 other test dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk6/igt@i915_selftest@mock.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][130] ([i915#4817])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk2/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#4212]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4215])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4212]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#8709]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#8709]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#8709]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#8709]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][139] ([i915#1982]) +1 other test incomplete
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk9/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][140] ([i915#13287])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg1:          [PASS][141] -> [FAIL][142] ([i915#5956])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#1769] / [i915#3555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#1769] / [i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#1769] / [i915#3555])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][146] -> [FAIL][147] ([i915#11808] / [i915#5956]) +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][148] ([i915#5956])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538] / [i915#5286]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#5286]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#5286]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#5286])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#5286]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][154] +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3638]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#4538] / [i915#5190]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3638]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#6187])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#5190])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] +54 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#4538]) +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#12313]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#6095]) +177 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#6095]) +169 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#6095]) +74 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#12313])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6095]) +24 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][169] ([i915#12964]) +15 other tests dmesg-warn
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#12805])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#6095]) +90 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#6095]) +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#6095]) +49 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3742])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7213]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3742])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7828]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7828]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-11/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7828]) +14 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#7828]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#7828]) +9 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#7828]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3116] / [i915#3299])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3299])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3299]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3116]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#3116] / [i915#3299])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3299]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#6944] / [i915#9424])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-7/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#9424])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9424])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#6944] / [i915#9424])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9424]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#6944] / [i915#7116] / [i915#7118])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3555]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#13049]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#13049])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8814])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][201] -> [DMESG-WARN][202] ([i915#12964]) +40 other tests dmesg-warn
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3555]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#13049]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][206] ([i915#12964]) +2 other tests dmesg-fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#9809])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#13046] / [i915#5354]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#4103] / [i915#4213]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#4103]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#9067])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#9067])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#4213])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#4103] / [i915#4213])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#4103])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][216] ([i915#12170])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][217] ([i915#11968])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9833])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3804])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#1257])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_dp_aux_dev.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#1257])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#8812])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#3555] / [i915#3840]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3555] / [i915#3840]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#3555] / [i915#3840])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3555] / [i915#3840])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#3840])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#3469])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#1839])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#9337])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9337])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#658])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#4881])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#4881])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#3637]) +8 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#8381]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9934]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#8381]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9934]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][241] ([i915#12745] / [i915#4839])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][242] ([i915#4839])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3637]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#9934]) +7 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#3637]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8381]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-mtlp:         [PASS][247] -> [FAIL][248] ([i915#11989]) +1 other test fail
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][249] ([i915#11989])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8810]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#2672]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672] / [i915#3555])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#2587] / [i915#2672]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#2672] / [i915#8813]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555] / [i915#5190])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#2672]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5274])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#5354]) +22 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#1825]) +24 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][269] +46 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#1825]) +12 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8708]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-snb:          [PASS][272] -> [SKIP][273] +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][274] -> [DMESG-FAIL][275] ([i915#12964]) +1 other test dmesg-fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][276] ([i915#10056])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3458]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#8708]) +18 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#10433] / [i915#3458])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#8708]) +14 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#5439])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][282] +83 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#3023]) +13 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#3458]) +14 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][285] +402 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#6118])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#12713])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3555] / [i915#8228]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#3555] / [i915#8228])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#10656])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#12388])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#10656])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#10656])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#12339])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#6301])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][298] +9 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][299] ([i915#12756]) +1 other test incomplete
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][300] ([i915#12178])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][301] ([i915#7862]) +1 other test fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][302] ([i915#12177])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][303] ([i915#10647]) +1 other test fail
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8821])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#3555]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#12247]) +13 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#12247]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#12247] / [i915#9423])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#12247]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12247] / [i915#3555])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#12247] / [i915#3555])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#9812])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9812])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#12343])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#12343])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9685])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9685])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#3361])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#4281])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#8430])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9519]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][322] -> [SKIP][323] ([i915#9519]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#6524])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#6524])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#6524])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#12316]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#11520]) +8 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#11520]) +6 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][331] ([i915#11520]) +10 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#11520]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#11520]) +6 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9683]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#9683])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#9683])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9683])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#9688]) +13 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-3/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#9732]) +14 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +31 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +13 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +16 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#9732]) +20 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][347] +365 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#9685])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#5289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#12755]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#12755] / [i915#5190])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#5289]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#5289])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg1:          [PASS][354] -> [DMESG-WARN][355] ([i915#4423])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-12/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][356] ([i915#13179]) +1 other test abort
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][357] ([i915#13179]) +1 other test abort
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-snb5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][358] ([i915#13179]) +1 other test abort
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][359] -> [FAIL][360] ([i915#5465]) +2 other tests fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-9/igt@kms_setmode@basic.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-10/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][361] -> [FAIL][362] ([i915#5465]) +2 other tests fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][363] ([IGT#160])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][364] ([IGT#160] / [i915#6493])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#8623])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][366] ([i915#12276]) +1 other test incomplete
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#11920])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#11920])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-7/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#11920])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#11920])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-3/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#11920])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#3555] / [i915#9906])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][373] ([i915#3555] / [i915#9906])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#3555] / [i915#9906])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555] / [i915#9906])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#8808] / [i915#9906])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#9906])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#2437] / [i915#9412])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#2437]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk9/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#2437])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#2437] / [i915#9412])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#2437] / [i915#9412])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#2437] / [i915#9412])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#2437] / [i915#9412])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#2437])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#8516])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_busy@hang:
    - shard-rkl:          [PASS][387] -> [DMESG-WARN][388] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-rkl-5/igt@prime_busy@hang.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-6/igt@prime_busy@hang.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3708] / [i915#4077]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-4/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#3708])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#3708])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][392] ([i915#12910]) +19 other tests fail
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#9917]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#9917])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-3/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][395] ([i915#12910]) +8 other tests fail
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][396] ([i915#12910]) +8 other tests fail
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][397] +7 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#4818])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][399] ([i915#4818])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-mtlp:         [ABORT][400] -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-8/igt@debugfs_test@read_all_entries_display_off.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@debugfs_test@read_all_entries_display_off.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [ABORT][402] ([i915#5507]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-8/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_create@busy-create:
    - shard-dg1:          [INCOMPLETE][404] -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-14/igt@gem_create@busy-create.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-12/igt@gem_create@busy-create.html

  * igt@gem_create@busy-create@lmem0:
    - shard-dg2:          [INCOMPLETE][406] -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-1/igt@gem_create@busy-create@lmem0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-6/igt@gem_create@busy-create@lmem0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][408] ([i915#12353]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-glk7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][410] ([i915#11980] / [i915#12580]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-7/igt@gem_ctx_persistence@hostile.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@unwedge-stress:
    - shard-mtlp:         [INCOMPLETE][412] -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-2/igt@gem_eio@unwedge-stress.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-2/igt@gem_eio@unwedge-stress.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][414] ([i915#5493]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][416] ([i915#10729]) -> [PASS][417] +1 other test pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglu:         [SKIP][418] ([i915#4270]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [DMESG-WARN][420] ([i915#13029]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-10/igt@i915_module_load@reload-no-display.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-5/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][422] ([i915#12817] / [i915#9820]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][424] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [WARN][426] ([i915#12653]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [SKIP][428] -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg2-1/igt@i915_pm_rpm@gem-idle.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg2-10/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg1:          [FAIL][430] -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15826/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-tglu:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12300/index.html
