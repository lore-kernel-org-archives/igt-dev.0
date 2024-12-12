Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE56E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 10:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBAB10ED5B;
	Thu, 12 Dec 2024 10:45:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49D010ED5B;
 Thu, 12 Dec 2024 10:45:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel-ci=3A_Update?=
 =?utf-8?q?_chamelium-only=2Etestlist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 10:45:07 -0000
Message-ID: <173400030770.1547317.16652230006694801770@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212042509.30614-1-karthik.b.s@intel.com>
In-Reply-To: <20241212042509.30614-1-karthik.b.s@intel.com>
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

Series: tests/intel-ci: Update chamelium-only.testlist
URL   : https://patchwork.freedesktop.org/series/142462/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15828_full -> IGTPW_12302_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12302_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12302_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12302_full:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_on.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-17/igt@gem_eio@in-flight-contexts-10ms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb5/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [CRASH][9] +3 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [DMESG-WARN][13] ([i915#12964]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  
Known issues
------------

  Here are the changes found in IGTPW_12302_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#6230])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#6230])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-8/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9318])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#11078]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#11078])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +12 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8414]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8414])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4873])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@gem_caching@reads.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#13008])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#13008])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#7697]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#7697])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#6335])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#6335])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8562])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][39] ([i915#1099]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb7/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][41] ([i915#11980] / [i915#12580])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#11980] / [i915#12580])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4771])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4771])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4812]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4036])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4525]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4525]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][54] ([i915#11713])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-4/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#6334]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3539]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3281]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281]) +14 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3281]) +15 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4537] / [i915#4812])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][64] ([i915#7975] / [i915#8213]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4860]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4860]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4860])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#2190])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#4613])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][70] ([i915#4613]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#4613]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][73] -> [TIMEOUT][74] ([i915#5493]) +1 other test timeout
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          NOTRUN -> [TIMEOUT][75] ([i915#5493]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4613])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#12193])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4565])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4077]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +12 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][81] -> [ABORT][82] ([i915#10729]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4083]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4083]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3282]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@bench:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3282]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@gem_pread@bench.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][88] ([i915#2658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4270])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4270]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12964])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         [PASS][94] -> [SKIP][95] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3282]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8428])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#5190] / [i915#8428]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4079])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#8411]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4079])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4885])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4077]) +12 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4879])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297] / [i915#3323])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#3323])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3282] / [i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-8/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3297]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3297])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][115] +10 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#2856])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#2527]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#2527] / [i915#2856]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-5/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#2856]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#2527]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][122] -> [ABORT][123] ([i915#13010]) +1 other test abort
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-10/igt@i915_module_load@reload-no-display.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu-1:       NOTRUN -> [ABORT][124] ([i915#12817] / [i915#9820])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#8436])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#8399])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][127] ([i915#2681]) +4 other tests warn
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#11681] / [i915#6621]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#11681] / [i915#6621])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#11681] / [i915#6621])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#11681]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][132] ([i915#8346])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][133] ([i915#9311]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb4/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][134] ([i915#9311]) +1 other test dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][135] ([i915#9311]) +1 other test dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu-1:       NOTRUN -> [ABORT][136] ([i915#13010]) +1 other test abort
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@i915_selftest@perf.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#4817])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4212])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4212]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#8709]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#8709]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#8709]) +11 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#9531])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#1769] / [i915#3555])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#1769] / [i915#3555])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#1769] / [i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#1769] / [i915#3555])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][149] ([i915#1769])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#1769] / [i915#3555])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][151] -> [FAIL][152] ([i915#5956]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-dg1:          [PASS][153] -> [DMESG-WARN][154] ([i915#4423]) +4 other tests dmesg-warn
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-14/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         [PASS][155] -> [FAIL][156] ([i915#11808] / [i915#5956]) +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#5286]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#5286]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#5286]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5286]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#5286]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][162] +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3638]) +6 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +11 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3638]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4538]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][167] -> [DMESG-WARN][168] ([i915#12964]) +23 other tests dmesg-warn
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#6095]) +193 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#10307] / [i915#6095]) +182 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#6095]) +74 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#12313]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#6095]) +108 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#6095]) +34 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#6095]) +21 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][176] ([i915#12796])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#12313]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#12313]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#12313])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#12313])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#12313])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#6095]) +19 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#7213] / [i915#9010]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3742])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3742])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#11616] / [i915#7213]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3742]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4087]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#7828]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#7828]) +8 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#7828]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#7828]) +13 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#7828]) +14 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#7828]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#7116] / [i915#9424])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-snb:          NOTRUN -> [INCOMPLETE][197] ([i915#8816])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3299]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3116]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#9424]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@kms_content_protection@mei-interface.html
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#6944] / [i915#9424])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9424])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#8063] / [i915#9433])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#7116])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#8814])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3555]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#13049])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#13049])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#8814])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3555])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3555]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][213] ([i915#12358] / [i915#7882])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][214] -> [DMESG-FAIL][215] ([i915#12964]) +3 other tests dmesg-fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][216] ([i915#12358])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][217] +24 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#4103] / [i915#4213])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4103] / [i915#4213]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#4103]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#13046] / [i915#5354]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#9809]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][223] ([i915#2346]) +1 other test fail
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#4213])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#9723])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#9723])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8827])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][228] -> [SKIP][229] ([i915#3555])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#1257])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#3840])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3840])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#3840]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#3469])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3955]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3469])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#4854])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#4854])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#1839])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#658])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#3637]) +10 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9934]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#9934]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3637])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9934]) +8 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#3637]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][247] ([i915#12745] / [i915#4839])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][248] ([i915#12745])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#2672]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#2672]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672] / [i915#3555])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2587] / [i915#2672]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#2672] / [i915#3555]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8813])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#8810])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#8813]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#2672] / [i915#3555])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][265] -> [FAIL][266] ([i915#6880])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][267] ([i915#6880])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][268] +48 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [PASS][269] -> [SKIP][270] +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] +36 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#5439])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#5439])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#8708]) +16 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#5354]) +33 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#1825]) +47 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8708]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#3023]) +31 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#5439])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#10055])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][281] +85 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3458]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#3458]) +17 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#1825]) +12 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#8708]) +28 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#12713])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#12388])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#10656])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#10656])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12388])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#12339])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#6301])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#6301])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#6301])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#11614] / [i915#3582]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#8806])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#3555]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#12247]) +16 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12247]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#12247]) +13 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#12247]) +16 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12247] / [i915#6953] / [i915#9423])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#12247] / [i915#6953])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#12247] / [i915#6953]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#12247] / [i915#6953])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#12247] / [i915#6953]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12247]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#12247]) +7 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#5354])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9812])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#5978])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#9685])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9685])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#3828])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#9519])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][321] -> [FAIL][322] ([i915#8717])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-3/igt@kms_pm_rpm@i2c.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#9519]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9519]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9519]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9519])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2:          [PASS][327] -> [SKIP][328] ([i915#9519])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#6524]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#6524]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#6524])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#6524] / [i915#6805])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#11520]) +9 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][334] ([i915#11520]) +12 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#11520]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#11520]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#9808]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#12316]) +4 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#11520]) +6 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#11520]) +9 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#11520]) +10 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#9683]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#4348])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#9683])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#9683])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#9683]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9688]) +10 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-5/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +24 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#1072] / [i915#9732]) +25 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][350] ([i915#9732]) +12 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#1072] / [i915#9732]) +22 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-4/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#4077] / [i915#9688]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#1072] / [i915#9732]) +26 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][354] +366 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#9685])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#5289])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#5289])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#5289]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#5289])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#12755]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3555]) +6 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#8623])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#8623])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#8623])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][365] -> [INCOMPLETE][366] ([i915#12276])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][367] ([i915#12964]) +8 other tests dmesg-warn
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-3/igt@kms_vblank@wait-forked-busy-hang@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#11920])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#11920])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-10/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#8808] / [i915#9906])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-4/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#9906]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-6/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#2437])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-9/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][375] ([i915#2437])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#2437] / [i915#9412])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#2437])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#2437]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#2437]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#2437] / [i915#9412]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#2437] / [i915#9412])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#7387])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-10/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#2433])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [FAIL][384] ([i915#11943])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [FAIL][385] ([i915#11943])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [PASS][386] -> [FAIL][387] ([i915#11943])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][388] +374 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg2:          [PASS][389] -> [FAIL][390] ([i915#4349]) +4 other tests fail
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@perf_pmu@busy-idle@vcs0.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-1/igt@perf_pmu@busy-idle@vcs0.html
    - shard-dg1:          [PASS][391] -> [FAIL][392] ([i915#4349]) +2 other tests fail
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-17/igt@perf_pmu@busy-idle@vcs0.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@busy-idle@vcs1:
    - shard-mtlp:         [PASS][393] -> [FAIL][394] ([i915#4349]) +5 other tests fail
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-2/igt@perf_pmu@busy-idle@vcs1.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@perf_pmu@busy-idle@vcs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#8516])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#8516])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][397] ([i915#9351])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][398] ([i915#9351])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#3708] / [i915#4077])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-5/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#3708] / [i915#4077])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-13/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#3708]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#9917]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#9917])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][404] ([i915#12910])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#4818])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-tglu:         [ABORT][406] ([i915#12817]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-10/igt@gem_exec_suspend@basic-s0@smem.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-rkl:          [DMESG-WARN][408] ([i915#12917] / [i915#12964]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-6/igt@gem_exec_whisper@basic-queues-priority.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [ABORT][410] -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][412] ([i915#12455]) -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][414] ([i915#12942]) -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][416] ([i915#12964]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@i915_selftest@live.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [DMESG-FAIL][418] -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][420] ([i915#13010]) -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-8/igt@i915_selftest@live@sanitycheck.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-tglu-2/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [ABORT][422] ([i915#12061]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [INCOMPLETE][424] ([i915#4817]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-rkl:          [FAIL][426] ([i915#13320]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/shard-rkl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [FAIL][428] -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.htm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12302/index.html
