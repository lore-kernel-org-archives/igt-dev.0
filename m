Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22A0E77188
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 00:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B1010E1DC;
	Thu, 19 Dec 2024 00:23:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB6710E1DC;
 Thu, 19 Dec 2024 00:23:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe=3A_Add_xe=5Fcgr?=
 =?utf-8?q?oup_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 00:23:35 -0000
Message-ID: <173456781582.214883.10843245310302172716@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217141601.369613-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241217141601.369613-1-maarten.lankhorst@linux.intel.com>
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

Series: tests/xe: Add xe_cgroup test
URL   : https://patchwork.freedesktop.org/series/142725/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8163_full -> IGTPW_12336_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12336_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12336_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12336_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-dg2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@gem_lmem_swapping@heavy-multi.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@gem_lmem_swapping@heavy-multi.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglu:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-6/igt@perf_pmu@all-busy-check-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@perf_pmu@all-busy-check-all.html
    - shard-dg1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-18/igt@perf_pmu@all-busy-check-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@perf_pmu@all-busy-check-all.html
    - shard-mtlp:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-5/igt@perf_pmu@all-busy-check-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-2/igt@perf_pmu@all-busy-check-all.html

  
Known issues
------------

  Here are the changes found in IGTPW_12336_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#6230])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#6230])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9318])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#11078])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-10/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8414]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8414]) +16 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3936])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#13008])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][31] -> [INCOMPLETE][32] ([i915#7297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#7697]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][36] -> [FAIL][37] ([i915#9561]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-1/igt@gem_ctx_freq@sysfs.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][38] ([i915#12353]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8555]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#8555])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#1099])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb2/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][43] -> [ABORT][44] ([i915#7975] / [i915#8213])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-18/igt@gem_eio@hibernate.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][45] -> [FAIL][46] ([i915#12543] / [i915#5784])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-14/igt@gem_eio@reset-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-mtlp:         [PASS][47] -> [ABORT][48] ([i915#13193]) +2 other tests abort
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-5/igt@gem_eio@unwedge-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4525])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4525]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#4525])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#6334]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4812]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3281]) +10 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#2190])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_linear_blits@basic:
    - shard-rkl:          [PASS][64] -> [DMESG-WARN][65] ([i915#12964]) +42 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-4/igt@gem_linear_blits@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@gem_linear_blits@basic.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4613] / [i915#7582])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#12193])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4565])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#4613]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4613]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4077]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4077]) +10 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@read-write:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4083]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@gem_mmap_wc@read-write.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][79] ([i915#2658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3282]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@gem_pwrite@basic-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3282])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-2/igt@gem_pwrite@basic-random.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][83] ([i915#12964])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][84] ([i915#12917] / [i915#12964]) +5 other tests timeout
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4270]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#4270]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-tglu:         [PASS][88] -> [SKIP][89] ([i915#4270]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-on.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#5190] / [i915#8428]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3282]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4079])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][93] ([i915#13263])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4879])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-7/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3297] / [i915#3323])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][98] ([i915#3323])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#3297]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3297] / [i915#4880])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297] / [i915#4880]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][103] ([i915#13356])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk9/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#2856])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#2527] / [i915#2856]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-2/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#2527]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#2856]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#2527]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][110] -> [ABORT][111] ([i915#9820])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][112] -> [ABORT][113] ([i915#10131] / [i915#9820])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][114] ([i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6412])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#8399])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#8399])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][118] ([i915#12797])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk1/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11681])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4387])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5723])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][124] ([i915#9311]) +1 other test dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][125] ([i915#7443])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][126] ([i915#4817])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk2/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][127] -> [INCOMPLETE][128] ([i915#4817])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7707])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4212])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#8709]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2:          NOTRUN -> [WARN][134] ([i915#13287])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][135] ([i915#13287]) +3 other tests crash
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][136] ([i915#13287])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#9531])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#9531])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][139] +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#5286])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5286]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#5286]) +7 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#5286]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][145] -> [DMESG-FAIL][146] ([i915#11627] / [i915#13314])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][147] -> [DMESG-FAIL][148] ([i915#13314])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3638]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg1:          [PASS][150] -> [DMESG-WARN][151] ([i915#4423]) +1 other test dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +9 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][153] +24 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][155] +80 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#12313]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6095]) +64 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +157 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6095]) +29 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#12805])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#6095]) +88 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +24 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][164] ([i915#12796])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#12313]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#12313]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6095]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#6095]) +174 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#3742])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3742])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][171] +23 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][172] +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#7828]) +8 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#7828]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7828]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7828]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#7828]) +12 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#7118] / [i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3116] / [i915#3299])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@kms_content_protection@mei-interface.html
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#6944] / [i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#7118])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#13049]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#13049])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#3555]) +8 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#8814])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][188] ([i915#12358] / [i915#7882])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][189] ([i915#12358])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#13046] / [i915#5354]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4103] / [i915#4213])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-glk:          NOTRUN -> [FAIL][192] ([i915#2346])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][193] -> [FAIL][194] ([i915#2346])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9067])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4103])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#9723])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#9723])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3555])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#12402])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3840])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3955])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3469])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#1839])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#1839]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#9337])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9337])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#658])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4881])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#9934]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8381])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#3637]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#9934]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#3637]) +8 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3637])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9934]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555] / [i915#8813])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#2672] / [i915#8813])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#2587] / [i915#2672]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555] / [i915#5190])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#5274])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1825]) +48 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5439])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#10055])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] +37 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8708]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#8708]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3023]) +26 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#9766])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9766])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#10433] / [i915#3458])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#8708])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#1825])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#5354]) +17 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3458]) +18 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3458]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][251] -> [SKIP][252] ([i915#3555] / [i915#8228]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#6403] / [i915#8826])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#9457]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#10656])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#12339])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#10656])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#12388])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#12388])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#1839])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#6301])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#6301])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#6301])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#6301])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][267] ([i915#10647] / [i915#12169]) +1 other test fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][268] ([i915#10647] / [i915#12177])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][269] ([i915#10647]) +5 other tests fail
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][270] ([i915#12964]) +22 other tests dmesg-warn
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8806])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#6953] / [i915#9423])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#12247]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#12247]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#12247]) +9 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#12247]) +9 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953] / [i915#9423])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#12247]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12247] / [i915#6953])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#12247] / [i915#6953])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#5354])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9812])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#12343])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12343])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#5354])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#5978])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][287] ([i915#9295])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#3361])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][290] -> [SKIP][291] ([i915#9519])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#6524])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#6524]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#11520]) +8 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#11520]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#11520]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#9808]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#12316]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#11520]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][300] ([i915#11520]) +10 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#11520]) +8 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][302] ([i915#11520]) +18 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#9732]) +9 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9732]) +16 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-6/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#9688]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +16 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#1072] / [i915#9732]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#1072] / [i915#9732]) +23 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][309] +721 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk2/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#9685])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9685]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#5289]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#5289])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#3555]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][315] ([i915#5465]) +2 other tests fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb1/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3555]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#8623])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][318] ([i915#12276]) +1 other test incomplete
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#11920])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#11920])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#9906])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-9/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#2437])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-12/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#2437] / [i915#9412]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#2437])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#2437] / [i915#9412]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][326] ([i915#2437]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#2437] / [i915#9412])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#2434])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-3/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#2433])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][330] +399 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb2/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-check-all:
    - shard-mtlp:         [PASS][331] -> [FAIL][332] ([i915#4349]) +1 other test fail
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-7/igt@perf_pmu@busy-check-all.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@perf_pmu@busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#8516]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-10/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_busy@hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][334] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@prime_busy@hang.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#3291] / [i915#3708])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#3708])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#10216] / [i915#3708])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#3708] / [i915#4077]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#3708] / [i915#4077])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#3708])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9917])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][342] ([i915#12910]) +9 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#9917])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][344] ([i915#12910]) +8 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][345] ([i915#12964]) -> [PASS][346] +40 other tests pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-3/igt@dmabuf@all-tests@dma_fence_chain.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-5/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-mtlp:         [ABORT][347] -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-4/igt@gem_eio@in-flight-internal-10ms.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][349] ([i915#13363]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-2/igt@gem_eio@kms.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - {shard-dg2-9}:      [FAIL][351] ([i915#12543] / [i915#5784]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-9/igt@gem_eio@reset-stress.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-9/igt@gem_eio@reset-stress.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][353] ([i915#11713]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-9/igt@gem_exec_big@single.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][355] ([i915#11441] / [i915#13304]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][357] ([i915#7975] / [i915#8213]) -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][359] -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][361] ([i915#13356]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][363] ([i915#3591]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][365] ([i915#7984]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-2/igt@i915_power@sanity.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@i915_selftest@live:
    - shard-dg2:          [INCOMPLETE][367] ([i915#12435]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@i915_selftest@live.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - shard-dg2:          [INCOMPLETE][369] -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-6/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [DMESG-WARN][371] ([i915#12917] / [i915#12964]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-4/igt@i915_suspend@basic-s2idle-without-i915.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-dg1:          [DMESG-WARN][373] ([i915#4391] / [i915#4423]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-18/igt@i915_suspend@basic-s2idle-without-i915.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-tglu:         [ABORT][375] ([i915#13010]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-3/igt@i915_suspend@basic-s2idle-without-i915.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-4/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][377] ([i915#5138]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [FAIL][379] ([i915#2346]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [SKIP][381] -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [FAIL][383] ([i915#6880]) -> [PASS][384] +2 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [SKIP][385] ([i915#3555] / [i915#8228]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-1/igt@kms_hdr@bpc-switch-dpms.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][387] ([i915#12756]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg1:          [DMESG-WARN][389] ([i915#4423]) -> [PASS][390] +2 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-12/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-18/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-rkl:          [DMESG-FAIL][391] ([i915#12964]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-1/igt@kms_pm_rpm@basic-rte.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-2/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][393] ([i915#9519]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][395] ([i915#5465]) -> [PASS][396] +2 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-7/igt@kms_setmode@basic.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-5/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][397] ([i915#9196]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][399] ([i915#4349]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-3/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@most-busy-check-all@vecs0:
    - shard-dg2:          [FAIL][401] ([i915#11943]) -> [PASS][402] +4 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-6/igt@perf_pmu@most-busy-check-all@vecs0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-10/igt@perf_pmu@most-busy-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][403] ([i915#5493]) -> [DMESG-WARN][404] ([i915#5493]) +1 other test dmesg-warn
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [TIMEOUT][405] ([i915#12964]) -> [SKIP][406] ([i915#4270])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][407] ([i915#13010]) -> [ABORT][408] ([i915#12817] / [i915#9820])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          [INCOMPLETE][409] -> [INCOMPLETE][410] ([i915#13287]) +1 other test incomplete
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb5/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg1:          [SKIP][411] ([i915#4423] / [i915#6095]) -> [SKIP][412] ([i915#6095]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-12/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg1-13/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@content-type-change:
    - shard-snb:          [INCOMPLETE][413] ([i915#8816]) -> [SKIP][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb7/igt@kms_content_protection@content-type-change.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-snb4/igt@kms_content_protection@content-type-change.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][415] ([i915#12745] / [i915#1982] / [i915#4839]) -> [INCOMPLETE][416] ([i915#12745] / [i915#4839])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][417] ([i915#12745] / [i915#1982]) -> [INCOMPLETE][418] ([i915#12745])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][419] ([i915#10433] / [i915#3458]) -> [SKIP][420] ([i915#3458]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][421] ([i915#3458]) -> [SKIP][422] ([i915#10433] / [i915#3458])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][423] ([i915#1187] / [i915#12713]) -> [SKIP][424] ([i915#12713])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11627]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11627
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12336/index.html
