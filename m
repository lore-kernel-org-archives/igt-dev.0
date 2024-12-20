Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7221E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 16:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD6B10E2CA;
	Fri, 20 Dec 2024 16:08:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E95110E2CA;
 Fri, 20 Dec 2024 16:08:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Flease=3A_Add?=
 =?utf-8?q?_vblank_count_to_avoind_resource_busy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 16:08:14 -0000
Message-ID: <173471089405.818362.9692840954904072637@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219163938.475114-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241219163938.475114-1-mohammed.thasleem@intel.com>
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

Series: tests/kms_lease: Add vblank count to avoind resource busy
URL   : https://patchwork.freedesktop.org/series/142838/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8167_full -> IGTPW_12356_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12356_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12356_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12356_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rps@reset:
    - shard-dg2:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-1/igt@i915_pm_rps@reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@i915_pm_rps@reset.html
    - shard-dg1:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg1-17/igt@i915_pm_rps@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@i915_pm_rps@reset.html

  * igt@kms_histogram@algo-basic:
    - shard-dg1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-rkl:          NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_histogram@algo-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-tglu:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_histogram@global-basic.html
    - shard-dg2:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_histogram@global-basic.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-mtlp:         [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-5/igt@perf_pmu@all-busy-check-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-5/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-gt0.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][16] ([i915#7975] / [i915#8213]) -> [DMESG-WARN][17] +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices.html

  
Known issues
------------

  Here are the changes found in IGTPW_12356_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6230])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#8411]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#9318])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#9318])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#11078]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#11078])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8414]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8414]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8414]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@drm_fdinfo@isolation.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#7697]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#3555] / [i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#3555] / [i915#9323]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#3555] / [i915#9323]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][34] ([i915#7297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-3/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#9323]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][36] ([i915#12392] / [i915#7297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#6335])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][38] ([i915#12353]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#8555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#8555]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#1099]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][44] -> [ABORT][45] ([i915#7975] / [i915#8213])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg1-12/igt@gem_eio@hibernate.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-tglu:         [PASS][46] -> [ABORT][47] ([i915#10030] / [i915#7975] / [i915#8213])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-tglu-3/igt@gem_eio@hibernate.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][48] -> [DMESG-WARN][49] ([i915#13363])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-tglu-3/igt@gem_eio@kms.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][50] ([i915#5784])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@wait-wedge-1us:
    - shard-mtlp:         [PASS][51] -> [ABORT][52] ([i915#13193])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-1/igt@gem_eio@wait-wedge-1us.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@gem_eio@wait-wedge-1us.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4812]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4771]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4771])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4525])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4525]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@sliced:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4812])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][59] ([i915#11713])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][60] ([i915#11965]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#6334]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#6334]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-rkl:          [PASS][65] -> [DMESG-WARN][66] ([i915#12964]) +35 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-7/igt@gem_exec_gttfill@engines@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@gem_exec_gttfill@engines@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3281]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#3281]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3281]) +12 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3281]) +8 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4812])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][72] -> [INCOMPLETE][73] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4860]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4860]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4860]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4613]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#4613]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#4613]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4613])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4083]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@gem_mmap@big-bo.html
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4077]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4077]) +9 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@close:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4083]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3282]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][89] ([i915#2658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3282]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@gem_pwrite@basic-exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3282]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#13033])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4270]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-snb:          NOTRUN -> [SKIP][94] +494 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb4/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4270]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#8428]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][99] +421 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4079]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][102] -> [INCOMPLETE][103] ([i915#13306])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-glk9/igt@gem_softpin@noreloc-s3.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4077]) +19 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4079]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3297]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3297]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#3297])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][112] ([i915#13273] / [i915#13356])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#13356])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#2856]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#2527]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#2527] / [i915#2856]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#2527]) +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#8399])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#8399])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#8399])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][123] ([i915#2681]) +4 other tests warn
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][124] ([i915#4423])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#11681]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#11681])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#8437])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][128] -> [ABORT][129] ([i915#12061]) +1 other test abort
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][130] ([i915#9311]) +1 other test dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb2/igt@i915_selftest@mock.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4212]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4212]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#4212])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#8709]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#8709]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#8709]) +11 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#8709]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#8709]) +15 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-snb:          NOTRUN -> [INCOMPLETE][139] ([i915#13287] / [i915#9878])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@kms_async_flips@crc.html
    - shard-dg2:          NOTRUN -> [WARN][140] ([i915#13287])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][141] ([i915#13287]) +7 other tests crash
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][142] ([i915#13287])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#10333])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#9531])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#9531])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#9531])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][148] ([i915#1769])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][149] -> [FAIL][150] ([i915#5956]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#5286]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#5286]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#5286]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][155] -> [DMESG-FAIL][156] ([i915#13314])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3638]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3638]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][159] +12 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4538] / [i915#5190]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#4538]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6095]) +44 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#12313]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12313])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#12313]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#6095]) +170 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#6095]) +98 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#10307] / [i915#6095]) +127 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6095]) +69 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#12313])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#12313])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#12805])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#6095]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#6095]) +39 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#12313])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3742])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3742])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#11616] / [i915#7213]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4087]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][181] +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#7828]) +13 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#7828]) +14 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#7828]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#7828]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#7828]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#7828]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#3555] / [i915#9979])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#7118] / [i915#9424])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3116] / [i915#3299]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3299])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3299])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9424])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#7118])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#7118])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#6944])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#7118] / [i915#9424]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#7116] / [i915#9424])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#13049])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#13049])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3555]) +11 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#13049])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#13049])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#8814]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3555]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8814])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#4103] / [i915#4213]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#4103])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#4103]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#9809]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][214] +95 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#13046] / [i915#5354]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][216] ([i915#2346])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#9067])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#9067])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9067])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#9067])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-10/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#4103] / [i915#4213])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][222] ([i915#12170])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][223] ([i915#11968])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#8588])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#8588])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#8588])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#8588])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#1257])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#3840]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3840] / [i915#9688])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3840])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3840])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3840])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#3840])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#3840]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#3840] / [i915#9053])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3955])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3469])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#4854])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#1839])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1839])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#1839])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#9337])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3637]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9934]) +15 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#8381])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9934]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][248] ([i915#4839])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk8/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][249] ([i915#12901]) +1 other test dmesg-warn
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#3637]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9934]) +10 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-snb:          [PASS][252] -> [FAIL][253] ([i915#11989]) +1 other test fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#3637]) +10 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#8381])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#8381])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][258] ([i915#12745])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-mtlp:         [PASS][259] -> [FAIL][260] ([i915#11989]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][261] ([i915#11989] / [i915#12840]) +1 other test fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-tglu-1:       NOTRUN -> [FAIL][262] ([i915#11989]) +1 other test fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][263] ([i915#11989])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#2587] / [i915#2672]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#2672]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#2672]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#2672] / [i915#8813]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#2587] / [i915#2672] / [i915#3555])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#2672] / [i915#3555]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#2672] / [i915#3555]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#2587] / [i915#2672]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8810] / [i915#8813]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8810]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#2672] / [i915#3555]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555] / [i915#5190])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#5354]) +19 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#8708]) +8 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] +44 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [PASS][283] -> [SKIP][284] +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][285] +45 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][286] -> [FAIL][287] ([i915#6880]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#5439]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#5439])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3458]) +20 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3023]) +38 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#8708]) +12 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#1825]) +59 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3458]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#1825]) +16 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#8708]) +25 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#3555] / [i915#8228]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8228])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#3555] / [i915#8228]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#12339])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-5/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#12339])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#10656])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#12394])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#4816])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#6301])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-9/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#6301])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#6301])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][311] ([i915#13026])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][312] ([i915#12964]) +27 other tests dmesg-warn
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#11614] / [i915#3582]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8821])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#12247]) +13 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#12247] / [i915#6953] / [i915#9423])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#12247] / [i915#6953])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#12247] / [i915#6953])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12247] / [i915#6953])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#12247]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#12247] / [i915#6953]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#12247]) +16 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#12247]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#12247]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#12247]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#12247] / [i915#3555])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9812])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12343])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9812])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#9293])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#9685])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#3361])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#4281])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#9340])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#9340])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#3828])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#8430])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#9519])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#9519])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][341] -> [SKIP][342] ([i915#9519]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#9519])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#6524] / [i915#6805])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-11/igt@kms_prime@basic-crc-vgem.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][345] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#6524])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#6524])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#11520]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][349] ([i915#11520]) +9 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#11520]) +6 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#11520]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#12316]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#11520]) +13 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][354] ([i915#11520]) +12 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#11520]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9683])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#9683])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#9683]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#9683])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#1072] / [i915#9732]) +27 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#9688]) +11 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-1/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#9732]) +15 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#9732]) +24 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-4/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#4077] / [i915#9688]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-6/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#1072] / [i915#9732]) +30 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#9732]) +10 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#9685]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#9685])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#5289])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#5289])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#5190])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#12755] / [i915#5190])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#12755]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555]) +4 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][376] ([i915#13179]) +1 other test abort
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][377] ([i915#5465]) +2 other tests fail
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][378] ([i915#3555]) +2 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#3555]) +6 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#8623])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][381] ([i915#12276]) +1 other test incomplete
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#11920])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#11920])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#11920])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#11920])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#9906]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-7/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#9906])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3555] / [i915#9906])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#3555] / [i915#9906])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#2437] / [i915#9412])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#2437])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#2437])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-13/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#2437])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][395] ([i915#2437] / [i915#9412])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#2434])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@perf@mi-rpc.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [PASS][397] -> [FAIL][398] ([i915#11943])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][399] ([i915#4349]) +4 other tests fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [ABORT][400] ([i915#13010])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6:
    - shard-rkl:          [PASS][401] -> [DMESG-FAIL][402] ([i915#12964]) +2 other tests dmesg-fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-5/igt@perf_pmu@rc6.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][403] ([i915#8516])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#3708] / [i915#4077])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][405] ([i915#3291] / [i915#3708])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][406] ([i915#3708]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#3708]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#9917])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#9917])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][410] ([i915#12910]) +9 other tests fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][411] +29 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][412] ([i915#12543] / [i915#5784]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg1-17/igt@gem_eio@reset-stress.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [FAIL][414] ([i915#12714] / [i915#5784]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-5/igt@gem_eio@unwedge-stress.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-8/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          [FAIL][416] ([i915#12714] / [i915#5784]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg1-14/igt@gem_eio@unwedge-stress.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][418] ([i915#10729]) -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_offset@open-flood:
    - shard-rkl:          [DMESG-WARN][420] -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-3/igt@gem_mmap_offset@open-flood.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-1/igt@gem_mmap_offset@open-flood.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][422] ([i915#9820]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][424] ([i915#10131] / [i915#10887]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][426] ([i915#12455]) -> [PASS][427] +1 other test pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         [ABORT][428] ([i915#13010]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-tglu-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-tglu-8/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [DMESG-FAIL][430] ([i915#12964]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8167/shard-rkl-7/igt@i915_suspend@sysfs-reader.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][432] ([i915#2346]) -> [PASS][433]
   [432]: https://intel-gfx-ci

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12356/index.html
