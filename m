Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D05E7718B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 13:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CFD10E328;
	Mon, 23 Dec 2024 13:42:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8FE10E328;
 Mon, 23 Dec 2024 13:42:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/gem=5Fexec?=
 =?utf-8?q?=5Fbalancer=3A_Decrease_expected_load_value_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Dec 2024 13:42:21 -0000
Message-ID: <173496134175.2104684.4971087263182712614@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
In-Reply-To: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
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

Series: tests/intel/gem_exec_balancer: Decrease expected load value (rev4)
URL   : https://patchwork.freedesktop.org/series/142150/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8163_full -> IGTPW_12337_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12337_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12337_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12337_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_read@invalid-buffer:
    - shard-dg1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-17/igt@drm_read@invalid-buffer.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@drm_read@invalid-buffer.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-mtlp:         [PASS][3] -> [WARN][4] +1 other test warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-fence.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-rkl:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-2/igt@i915_pm_rpm@debugfs-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@i915_pm_rpm@debugfs-read.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][8] ([i915#12941]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][10] ([i915#12941]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  
Known issues
------------

  Here are the changes found in IGTPW_12337_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#6230])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9318])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8414]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +16 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3936])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3555] / [i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-8/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#13008])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][27] ([i915#12392] / [i915#7297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-5/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#7697]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#6335]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][31] -> [FAIL][32] ([i915#9561]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-1/igt@gem_ctx_freq@sysfs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#1099]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb4/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][35] ([i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4812]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4525])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#6334]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_parallel@userptr@vecs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][44] ([i915#12964]) +35 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@gem_exec_parallel@userptr@vecs0.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#2190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4613] / [i915#7582])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4613])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#4613]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#12193])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4565])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-1/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4077]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4077])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][66] ([i915#2658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3282]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][69] ([i915#12964])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][70] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#13033])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         [PASS][73] -> [SKIP][74] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][78] +729 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3282]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4079]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][81] ([i915#13263])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3297]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4880])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#4880]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][87] ([i915#13356])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][88] -> [ABORT][89] ([i915#5566])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#2527])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          NOTRUN -> [ABORT][96] ([i915#9820])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][97] -> [ABORT][98] ([i915#10131] / [i915#10887] / [i915#9820])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [WARN][99] ([i915#12653])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#8399])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#6590]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#11681] / [i915#6621])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#11681] / [i915#6621])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#11681])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4387])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#5723])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][108] -> [DMESG-FAIL][109] ([i915#13342])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-5/igt@i915_selftest@live.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@i915_selftest@live.html
    - shard-tglu:         NOTRUN -> [ABORT][110] ([i915#12061] / [i915#13010])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][111] -> [DMESG-FAIL][112] ([i915#13338])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-5/igt@i915_selftest@live@gt_pm.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         NOTRUN -> [ABORT][113] ([i915#13010])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-9/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][114] -> [ABORT][115] ([i915#12061]) +1 other test abort
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][116] ([i915#9311]) +1 other test dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk7/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][117] ([i915#9311]) +1 other test dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][118] ([i915#7443])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][119] -> [INCOMPLETE][120] ([i915#4817])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#5190]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4212])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#8709]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2:          NOTRUN -> [WARN][124] ([i915#13287])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][125] ([i915#13287]) +3 other tests crash
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][126] ([i915#13287]) +7 other tests crash
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][127] ([i915#13287]) +1 other test incomplete
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#9531])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [PASS][129] -> [FAIL][130] ([i915#5956])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][132] ([i915#1769])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][133] ([i915#5956])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][134] +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#5286]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#5286]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#5286])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#5286]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3638])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3638]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6187])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5190]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][145] +73 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][146] -> [DMESG-WARN][147] ([i915#12964]) +30 other tests dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#6095]) +140 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6095]) +54 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#10307] / [i915#6095]) +166 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#6095]) +92 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6095]) +9 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#6095]) +20 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][156] ([i915#12796])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#12313]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#6095]) +14 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#12313]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4087]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][163] +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7828]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#7828])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#7828]) +9 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7828]) +10 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][169] ([i915#7173]) +3 other tests timeout
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3116] / [i915#3299])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7118])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#13049]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3555])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#13049])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][177] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#13049])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#8814]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][181] +31 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13046] / [i915#5354]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#4103])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-snb:          [PASS][184] -> [SKIP][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [PASS][186] -> [FAIL][187] ([i915#2346])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#9067])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#9723]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3555])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#12402])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][197] ([i915#9878])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3955])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#3469])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#2065] / [i915#4854])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#1839])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#1839]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#9337])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#9337])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#658])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#4881])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [FAIL][207] ([i915#11989]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb2/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3637]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#9934]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#9934]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3637]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#3637]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#9934]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][214] -> [FAIL][215] ([i915#11989]) +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-rkl:          [PASS][216] -> [FAIL][217] ([i915#11989])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-2/igt@kms_flip@plain-flip-ts-check.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][218] ([i915#11989]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555] / [i915#8813])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#2672] / [i915#8813])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2672]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555] / [i915#5190])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#5274])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#1825]) +49 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][234] +13 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          [PASS][235] -> [FAIL][236] ([i915#6880]) +1 other test fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#5439])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#10055])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#8708]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#4423] / [i915#9766])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#8708])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8708]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5354]) +17 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3458]) +17 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3458]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3023]) +22 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#1187] / [i915#12713])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][250] -> [SKIP][251] ([i915#3555] / [i915#8228]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#6403] / [i915#8826])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#9457]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#12339])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#12388])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#1839])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#6301])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] +37 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][261] ([i915#10647] / [i915#12169])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][262] ([i915#10647]) +1 other test fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-dg1:          [PASS][263] -> [DMESG-WARN][264] ([i915#4423]) +1 other test dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8806])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#6953] / [i915#9423])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#12247]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#12247]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247]) +9 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247]) +9 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#12247] / [i915#6953] / [i915#9423])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#12247]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#6953])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#5354]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#9812])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#12343])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12343])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#5354])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#9685])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#5978])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9685])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#3361])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][283] -> [FAIL][284] ([i915#8717])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-7/igt@kms_pm_rpm@i2c.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9519]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          [PASS][286] -> [SKIP][287] ([i915#9519]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#6524])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#6524])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#6524]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11520]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#11520]) +5 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#9808]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#12316]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#11520]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#11520]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#11520]) +8 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][298] ([i915#11520]) +12 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][299] ([i915#11520]) +17 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9732]) +8 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#9688]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#1072] / [i915#9732]) +18 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#9732]) +16 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-3/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#1072] / [i915#9732]) +8 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#1072] / [i915#9732]) +28 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#9685])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#5289])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#5289])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#3555]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][310] ([i915#13179]) +1 other test abort
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk4/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#8623])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][312] ([i915#10959])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][313] ([i915#12276]) +1 other test incomplete
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk5/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#3555]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9906])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#9906])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#2437] / [i915#9412]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#2437] / [i915#9412]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#2436])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#2434])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#2435])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#2433])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][323] +344 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb7/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-idle@vcs1:
    - shard-mtlp:         [PASS][324] -> [FAIL][325] ([i915#4349]) +2 other tests fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-4/igt@perf_pmu@busy-idle@vcs1.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-1/igt@perf_pmu@busy-idle@vcs1.html
    - shard-dg1:          [PASS][326] -> [FAIL][327] ([i915#4349]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-14/igt@perf_pmu@busy-idle@vcs1.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@perf_pmu@busy-idle@vcs1.html

  * igt@perf_pmu@busy-idle@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][328] ([i915#4349]) +1 other test fail
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@perf_pmu@busy-idle@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [PASS][329] -> [ABORT][330] ([i915#13010])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-10/igt@perf_pmu@module-unload.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][331] -> [FAIL][332] ([i915#4349]) +1 other test fail
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#8516])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#3291] / [i915#3708])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#3708])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#10216] / [i915#3708])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#3708] / [i915#4077])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#3708] / [i915#4077])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#3708])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-11/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#3708])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#9917])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][342] ([i915#12964]) -> [PASS][343] +39 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-3/igt@dmabuf@all-tests@dma_fence_chain.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-1/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][344] ([i915#12392] / [i915#7297]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-mtlp:         [ABORT][346] -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-4/igt@gem_eio@in-flight-internal-10ms.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-3/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][348] ([i915#13363]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-2/igt@gem_eio@kms.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-9/igt@gem_eio@kms.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][350] ([i915#13356]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][352] ([i915#7984]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-2/igt@i915_power@sanity.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@i915_selftest@live:
    - shard-dg2:          [INCOMPLETE][354] ([i915#12435]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@i915_selftest@live.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - shard-dg2:          [INCOMPLETE][356] -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-6/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [DMESG-WARN][358] ([i915#12917] / [i915#12964]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-4/igt@i915_suspend@basic-s2idle-without-i915.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          [FAIL][360] ([i915#12238]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-glk:          [FAIL][362] ([i915#11859]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][364] ([i915#5138]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-snb:          [SKIP][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [FAIL][368] ([i915#2346]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-glk:          [FAIL][370] ([i915#2346]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][372] ([i915#11989]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [FAIL][374] ([i915#6880]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg1:          [DMESG-WARN][376] ([i915#4423]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-12/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-12/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-rkl:          [DMESG-FAIL][378] ([i915#12964]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-1/igt@kms_pm_rpm@basic-rte.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-6/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][380] ([i915#9519]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][382] ([i915#9519]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][384] ([i915#5465]) -> [PASS][385] +2 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-7/igt@kms_setmode@basic.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][386] ([i915#9196]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][388] ([i915#4349]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@most-busy-check-all@vecs0:
    - shard-dg2:          [FAIL][390] ([i915#11943]) -> [PASS][391] +4 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-6/igt@perf_pmu@most-busy-check-all@vecs0.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@perf_pmu@most-busy-check-all@vecs0.html

  
#### Warnings ####

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [TIMEOUT][392] ([i915#12964]) -> [SKIP][393] ([i915#4270])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][394] ([i915#13010]) -> [ABORT][395] ([i915#12817] / [i915#9820])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg1:          [SKIP][396] ([i915#4423] / [i915#6095]) -> [SKIP][397] ([i915#6095])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-12/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@content-type-change:
    - shard-snb:          [INCOMPLETE][398] ([i915#8816]) -> [SKIP][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-snb7/igt@kms_content_protection@content-type-change.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-snb7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          [TIMEOUT][400] ([i915#7173]) -> [SKIP][401] ([i915#9424])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-10/igt@kms_content_protection@lic-type-0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][402] ([i915#9424]) -> [SKIP][403] ([i915#9433])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-17/igt@kms_content_protection@mei-interface.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][404] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][405] ([i915#12745] / [i915#1982] / [i915#4839])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][406] ([i915#4839]) -> [INCOMPLETE][407] ([i915#1982] / [i915#4839])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][408] ([i915#12745] / [i915#1982] / [i915#4839]) -> [INCOMPLETE][409] ([i915#12745] / [i915#4839])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][410] ([i915#12745] / [i915#1982]) -> [INCOMPLETE][411] ([i915#12745])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          [SKIP][412] -> [SKIP][413] ([i915#4423])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][414] ([i915#3458]) -> [SKIP][415] ([i915#10433] / [i915#3458]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][416] ([i915#10433] / [i915#3458]) -> [SKIP][417] ([i915#3458])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][418] ([i915#1187] / [i915#12713]) -> [SKIP][419] ([i915#12713])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][420] ([i915#3828]) -> [SKIP][421] ([i915#9340])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8163/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12238]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12238
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435
  [i915#12653]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12653
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12941]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12941
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13033
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13263
  [i915#13287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
  [i915#13338]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13338
  [i915#13342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13342
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#1769]: https://gitlab.freedesk

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12337/index.html
