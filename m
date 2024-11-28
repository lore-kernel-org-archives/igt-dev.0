Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DDFD690ED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 10:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C1010E318;
	Thu, 28 Nov 2024 10:00:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2260110E318;
 Thu, 28 Nov 2024 09:59:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Fplane=3AAdd_?=
 =?utf-8?q?more_logs_to_skips/failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 09:59:59 -0000
Message-ID: <173278799912.4046464.6730313240752285130@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128063539.1984668-1-pranay.samala@intel.com>
In-Reply-To: <20241128063539.1984668-1-pranay.samala@intel.com>
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

Series: tests/kms_plane:Add more logs to skips/failure (rev2)
URL   : https://patchwork.freedesktop.org/series/141653/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15755_full -> IGTPW_12212_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12212_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12212_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (1): shard-tglu-1 
  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12212_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-rkl:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-1/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@i915_selftest@live@gt_pm.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pm_rpm@basic-rte:
    - {shard-dg2-9}:      NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-9/igt@kms_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_12212_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-4/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#11078])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +9 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +41 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#4873])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@gem_caching@writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#13008])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#13008])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-5/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#13008])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#7697]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#6335])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#8562])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][34] -> [FAIL][35] ([i915#9561]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-11/igt@gem_ctx_freq@sysfs.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8555]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8555]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][39] ([i915#11980] / [i915#12580])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][40] ([i915#11980] / [i915#12580])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#1099])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-snb2/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#280]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][45] ([i915#10030] / [i915#7975] / [i915#8213])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-3/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4771])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4771]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4771]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4036])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4036])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4036])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#4525])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu-1:       NOTRUN -> [FAIL][53] ([i915#6117])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][54] ([i915#11965] / [i915#12558]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][55] ([i915#11965] / [i915#12558]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4812]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +19 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3281]) +16 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3281]) +17 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4537])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4812]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4537] / [i915#4812])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         NOTRUN -> [ABORT][67] ([i915#7975] / [i915#8213]) +1 other test abort
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4860]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4860]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4860]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613] / [i915#7582])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_lmem_swapping@basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#4613])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][75] ([i915#4613]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][76] ([i915#5493]) +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#12193])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4565])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#284])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-3/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#284])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#284])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@gem_media_vme.html

  * igt@gem_mmap@short-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4083]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4077]) +20 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4077]) +19 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4083]) +14 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4083]) +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +9 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][91] ([i915#2658]) +1 other test warn
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][92] ([i915#2658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12964])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4270]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917] / [i915#12964]) +1 other test timeout
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#3282]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][98] +332 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#8428]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +12 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4079]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8411])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4885]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4077]) +17 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4079]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#4079])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#4879])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3282] / [i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3282] / [i915#3297])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3297] / [i915#4880])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3281] / [i915#3297])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#3297]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3297]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][117] +37 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#2856]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#2527]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#2527] / [i915#2856]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#2856]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#2527]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#2527] / [i915#2856]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4881])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][125] ([i915#13029])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][126] ([i915#9820])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][127] ([i915#12817] / [i915#9820])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][128] ([i915#10131] / [i915#9820])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#6412])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#8399])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#6590]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#11681] / [i915#6621])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#11681] / [i915#6621]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#11681] / [i915#6621])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#11681])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6188])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][137] -> [DMESG-FAIL][138] ([i915#12964])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-1/igt@i915_selftest@live.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@i915_selftest@live.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][139] ([i915#9311]) +1 other test dmesg-warn
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-7/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][140] ([i915#9311]) +1 other test dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk2/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][141] ([i915#9311]) +1 other test dmesg-warn
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][142] ([i915#9311]) +1 other test dmesg-warn
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][143] ([i915#9311]) +1 other test dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][144] -> [ABORT][145] ([i915#13010]) +4 other tests abort
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-tglu-4/igt@i915_selftest@perf.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][146] ([i915#7443])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [PASS][147] -> [INCOMPLETE][148] ([i915#4817])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-glk1/igt@i915_suspend@fence-restore-untiled.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk9/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#7707])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#7707])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#4212])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4215])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4212]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4212]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12454] / [i915#12712])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#8709]) +11 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#8709]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#8709]) +11 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#9531])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#9531])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#1769] / [i915#3555])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#1769] / [i915#3555])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#1769] / [i915#3555])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#1769] / [i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][165] ([i915#5956]) +1 other test fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#5286])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#5286]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#5286]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5286]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#5286]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3638]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][172] +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3638]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4538] / [i915#5190]) +30 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6187]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#4538]) +13 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#12313])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#6095]) +192 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#10307] / [i915#6095]) +191 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#6095]) +99 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#10307] / [i915#10434] / [i915#6095])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#12805])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#6095]) +34 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#6095]) +94 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#12805])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#12805])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#12805])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#12805])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#6095]) +22 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#6095]) +74 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3742]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#11616] / [i915#7213]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3742])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4087]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#7828]) +16 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#7828]) +12 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#7828]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#7828]) +8 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#7828]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#7828]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][201] -> [SKIP][202] ([i915#3555]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-10/igt@kms_color@deep-color.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-11/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3116] / [i915#3299]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3299]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3299]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3116])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3299]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3116] / [i915#3299])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#9424])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#7116])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#6944])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#6944] / [i915#9424]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#7118] / [i915#9424]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#7118] / [i915#9424]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#7116] / [i915#9424]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3555]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#13049]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#13049]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8814]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555]) +8 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#3555]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#3555] / [i915#8814]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#13049]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#13049])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#13049])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3555]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#13049])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#7882])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][231] +14 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#9809]) +9 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#4103])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#4213])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#9067])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#9067])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#4103] / [i915#4213])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#4103] / [i915#4213])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#4103]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][240] ([i915#12964]) +18 other tests dmesg-warn
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9833])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#8588])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#8588])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#8588])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#12402])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8812])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#8812])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#3840]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#3555] / [i915#3840]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#3840])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#3555] / [i915#3840])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#3840]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#3955])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3469])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3469])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#3469])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2065] / [i915#4854])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_feature_discovery@chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#4854])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#4854])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#1839])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#1839])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9337])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#658])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#658])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#3637])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#3637]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#3637]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9934]) +11 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#8381])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#8381]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][271] ([i915#12745] / [i915#4839])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][272] ([i915#4839]) +1 other test incomplete
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9934]) +16 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][274] -> [FAIL][275] ([i915#11989]) +1 other test fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#9934]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg1:          [PASS][277] -> [FAIL][278] ([i915#11989] / [i915#12517] / [i915#12996])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
    - shard-dg2:          [PASS][279] -> [FAIL][280] ([i915#11989]) +2 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-11/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-11/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-tglu:         [PASS][281] -> [FAIL][282] ([i915#11989])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-tglu-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4:
    - shard-dg1:          [PASS][283] -> [FAIL][284] ([i915#11989]) +2 other tests fail
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][285] ([i915#12745])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [PASS][286] -> [FAIL][287] ([i915#11989] / [i915#12840])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-rkl:          [PASS][288] -> [FAIL][289] ([i915#11989])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
    - shard-tglu:         NOTRUN -> [FAIL][290] ([i915#11989]) +1 other test fail
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#2587] / [i915#2672]) +6 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#2672] / [i915#8813]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#2587] / [i915#2672]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#2587] / [i915#2672]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#2587] / [i915#2672] / [i915#3555])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8810]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#2672] / [i915#3555])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#2672] / [i915#3555]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#2672] / [i915#3555])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#2672])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#2672]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#2672] / [i915#3555] / [i915#8813]) +6 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2672] / [i915#3555]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#5274])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#5274])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][310] -> [FAIL][311] ([i915#6880])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#5354]) +75 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][313] +41 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#5439])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#3023]) +20 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#8708]) +31 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#1825]) +30 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][318] +68 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#4423])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] +36 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#8708]) +37 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#10055]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#10055])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9766])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#9766])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#9766])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][327] +102 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#1825]) +53 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#8708]) +13 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#3458]) +28 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#3458]) +16 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3555] / [i915#8228]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#12713])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#12713])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#3555] / [i915#8228])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8228]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          [PASS][337] -> [SKIP][338] ([i915#3555] / [i915#8228]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3555] / [i915#8228]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#3555] / [i915#8228])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#3555] / [i915#8228]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#10656])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#10656])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#12388])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#12388])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#12388])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#12388])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#12339])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#4816])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#1839])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#1839]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#6301])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#6301])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#6301])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#6301])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][356] ([i915#12756] / [i915#1982])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][357] ([i915#1982])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [PASS][358] -> [DMESG-WARN][359] ([i915#12964]) +54 other tests dmesg-warn
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#3555] / [i915#8821]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#3555] / [i915#8821])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#3555] / [i915#8806])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#5354] / [i915#9423])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#12247]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#12247]) +25 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#12247] / [i915#9423]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#12247]) +7 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][368] ([i915#12247]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [PASS][369] -> [DMESG-WARN][370] ([i915#12964] / [i915#1982])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#12247]) +18 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#12247] / [i915#6953]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#12247] / [i915#6953])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#12247] / [i915#6953])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#12247]) +18 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#12343])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#12343])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#3828])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#3828])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#3828])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#5978])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#9685]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-10/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#9685])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#9685])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#9685])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-17/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#3361])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#4281])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#8430])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#8430])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#8430])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#8430])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-5/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#8430])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][393] ([i915#9519])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [FAIL][394] ([i915#8717])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#9519])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#9519]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#9519])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][398] -> [SKIP][399] ([i915#9519]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15755/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#6524])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#6524])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#6524] / [i915#6805]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-1/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#6524]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#6524]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#11520]) +16 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#11520]) +5 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][407] ([i915#11520]) +12 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][408] ([i915#9808]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][409] ([i915#12316]) +10 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#11520]) +7 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][411] ([i915#11520]) +8 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-glk5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][412] ([i915#11520]) +4 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][413] ([i915#9683]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#9683])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][415] ([i915#9688]) +31 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-4/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#1072] / [i915#9732]) +30 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-14/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#9732]) +19 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-3/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][418] ([i915#9732]) +9 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#4077] / [i915#9688]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-8/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][420] ([i915#1072] / [i915#9732]) +15 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-3/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][421] ([i915#1072] / [i915#9732]) +39 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][422] ([i915#12755]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#5190]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#5289])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#5289]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][426] ([i9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12212/index.html
