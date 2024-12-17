Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF1CE7716A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 07:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FCB10E7E5;
	Tue, 17 Dec 2024 07:14:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F2010E7A4;
 Tue, 17 Dec 2024 07:14:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Fasync=5Fflip?=
 =?utf-8?q?s=3A_Create_subtest_for_overlay_planes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Dec 2024 07:14:09 -0000
Message-ID: <173441964955.3681322.10672315371968694990@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216202427.76168-1-andrealmeid@igalia.com>
In-Reply-To: <20241216202427.76168-1-andrealmeid@igalia.com>
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

Series: tests/kms_async_flips: Create subtest for overlay planes (rev2)
URL   : https://patchwork.freedesktop.org/series/142386/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15855_full -> IGTPW_12328_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12328_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12328_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12328_full:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries:
    - shard-mtlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-7/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][2] +2 other tests incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][5] +3 other tests crash
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4.html

  * {igt@kms_async_flips@overlay-atomic} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_async_flips@overlay-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_async_flips@overlay-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_async_flips@overlay-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-3/igt@kms_async_flips@overlay-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-1/igt@kms_async_flips@overlay-atomic.html

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb1/igt@kms_flip@basic-flip-vs-modeset@b-vga1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb5/igt@kms_flip@basic-flip-vs-modeset@b-vga1.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          [INCOMPLETE][13] ([i915#1982]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk9/igt@kms_async_flips@crc-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][15] ([i915#13287]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk9/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk6/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - {shard-dg2-9}:      [PASS][17] -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-9/igt@gem_exec_whisper@basic-queues-forked-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-9/igt@gem_exec_whisper@basic-queues-forked-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15855_full and IGTPW_12328_full:

### New IGT tests (1) ###

  * igt@kms_async_flips@overlay-atomic:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12328_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9318])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#11078])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8414]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#8414]) +25 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][26] -> [INCOMPLETE][27] ([i915#7297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb1/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][36] ([i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][37] -> [FAIL][38] ([i915#12543] / [i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-8/igt@gem_eio@reset-stress.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@gem_eio@reset-stress.html

  * igt@gem_eio@throttle:
    - shard-mtlp:         [PASS][39] -> [ABORT][40] ([i915#13193])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-4/igt@gem_eio@throttle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-4/igt@gem_eio@throttle.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4036])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4525]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +10 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +15 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +11 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][53] ([i915#11441] / [i915#13304])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][54] ([i915#11441])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][55] ([i915#4423]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4860])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-2/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#2190])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-9/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +8 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk4/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4077]) +9 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-8/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][73] ([i915#2658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-5/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][77] ([i915#2658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][78] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglu:         [PASS][80] -> [SKIP][81] ([i915#4270])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4270]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#5190] / [i915#8428]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4079])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4077]) +13 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][88] ([i915#13263])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#3323])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3282] / [i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3282] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-rkl:          [PASS][94] -> [DMESG-WARN][95] ([i915#12964]) +23 other tests dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@gem_userptr_blits@unsync-unmap.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3297]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#3297]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][100] +16 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#2527]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gen9_exec_parse@bb-secure.html
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#2856]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#2527] / [i915#2856]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-8/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#2527]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128]) -> ([PASS][129], [FAIL][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150]) ([i915#13138])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-11/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-11/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-1/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-1/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-2/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-2/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-3/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-3/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-3/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-4/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-4/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-5/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-5/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-6/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-6/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-7/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-7/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-7/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-8/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-8/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-3/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-3/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-6/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [PASS][151] -> [ABORT][152] ([i915#12817] / [i915#9820])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#8399])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [PASS][154] -> [FAIL][155] ([i915#3591])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [PASS][156] -> [FAIL][157] ([i915#12739] / [i915#3591])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][158] ([i915#2681]) +4 other tests warn
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#13328])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][160] ([i915#12797])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#11681] / [i915#6621])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#11681] / [i915#6621])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-5/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#11681] / [i915#6621])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#11681])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-3/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4387])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#6188])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][167] -> [ABORT][168] ([i915#12061]) +1 other test abort
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-2/igt@i915_selftest@live@workarounds.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-4/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [ABORT][169] ([i915#13010]) +3 other tests abort
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-7/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][170] ([i915#9311]) +1 other test dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk9/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][171] ([i915#9311]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][172] ([i915#9311]) +1 other test dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         [PASS][173] -> [ABORT][174] ([i915#13010])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-2/igt@i915_suspend@basic-s2idle-without-i915.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-3/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][175] ([i915#7443])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][176] -> [INCOMPLETE][177] ([i915#4817])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk9/igt@i915_suspend@debugfs-reader.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#7707])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4212]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4212])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#8709]) +3 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#8709]) +23 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#8709]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][184] ([i915#13287])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#9531])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][186] ([i915#1769])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#1769] / [i915#3555])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#1769] / [i915#3555])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][189] ([i915#12964]) +6 other tests dmesg-warn
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_atomic_transition@plane-all-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#5286]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4538] / [i915#5286]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#5286]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#5286]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#5286]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][195] -> [DMESG-FAIL][196] ([i915#11627] / [i915#13314])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][197]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3638]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#4538] / [i915#5190]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3638]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#4538]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#5190]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][203] +54 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#6095]) +170 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6095]) +49 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-3/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#12313])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#10307] / [i915#6095]) +166 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#6095]) +29 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#12805])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#6095]) +77 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12796]) +1 other test incomplete
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#6095]) +24 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#12313]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#12313])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#12313])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#6095]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#12313]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][219] +504 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#3742]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#11616] / [i915#7213]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#7828]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#7828]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#7828]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-2/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#7828]) +10 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#7828]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#7828]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_content_protection@atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#7116] / [i915#9424])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#7118] / [i915#9424])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3116])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#3116] / [i915#3299])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#9424])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9424])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#7118] / [i915#9424]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#6944] / [i915#9424])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-7/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#3555]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#13049]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3555]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3555]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#13049])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555]) +4 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#4103]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#4213])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#4103])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-snb:          [PASS][247] -> [SKIP][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#13046] / [i915#5354]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][250] -> [FAIL][251] ([i915#2346])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][252] -> [FAIL][253] ([i915#2346])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          NOTRUN -> [FAIL][254] ([i915#2346])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#4103] / [i915#4213])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#4103] / [i915#4213])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#9723])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#12402])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3840])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#3840])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#3840])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#3555] / [i915#3840])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#3840] / [i915#9053])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3469])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#3469])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#1839])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#9337])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#4881])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9934]) +7 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#3637]) +5 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-7/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#3637]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#9934]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#9934]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][274] ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][275] -> [FAIL][276] ([i915#11989]) +5 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8381])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-5/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#8381])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#12745] / [i915#4839])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#12745])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [PASS][281] -> [FAIL][282] ([i915#11989]) +2 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#2587] / [i915#2672]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#2672]) +6 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#2587] / [i915#2672] / [i915#3555])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#2672]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#2587] / [i915#2672]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#2672] / [i915#3555]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#2587] / [i915#2672]) +3 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#2672] / [i915#3555]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#5274])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          [PASS][296] -> [DMESG-WARN][297] ([i915#4423]) +1 other test dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [PASS][298] -> [FAIL][299] ([i915#6880])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [FAIL][300] ([i915#6880])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#1825]) +36 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#8708]) +12 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][303] +49 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#8708])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#1825]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][306] ([i915#10056])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-rkl:          [PASS][307] -> [DMESG-FAIL][308] ([i915#12964]) +1 other test dmesg-fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][309] ([i915#10056])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#5439])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#8708]) +13 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][312] +18 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#5354]) +23 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] +47 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#9766])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#3023]) +24 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#3458]) +15 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][318] +454 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#3458]) +19 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8228])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8228])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12713])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8228]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3555] / [i915#8228])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#10656])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#12388])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#12394])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#12339])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#10656])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#10656])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#12394])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#6301])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#13046] / [i915#5354] / [i915#9423])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#12247]) +14 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#12247]) +18 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#12247]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#12247]) +15 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12247] / [i915#9423]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#12247] / [i915#6953])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#12247] / [i915#3555])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#12247]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#12247] / [i915#6953])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#12247]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12247] / [i915#6953] / [i915#9423])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#9812])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#12343])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#12343])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#5354])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#5354])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#9812])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#9685])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#3361])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [PASS][353] -> [SKIP][354] ([i915#9519])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#9519])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9519])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#9519]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#11520]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#11520]) +7 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][360] ([i915#11520]) +13 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#11520]) +11 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#12316])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][363] ([i915#11520]) +13 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#11520]) +6 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#11520]) +7 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#9683])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#9683]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][368] ([i915#9683])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#9688]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-7/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#9732]) +13 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#1072] / [i915#9732]) +23 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#1072] / [i915#9732]) +20 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#1072] / [i915#9732]) +19 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-13/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#9732]) +11 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#9685]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#12755])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#12755] / [i915#5190])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#5289]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][379] ([i915#13179]) +1 other test abort
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][380] ([i915#13179]) +1 other test abort
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#3555]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#3555] / [i915#8809] / [i915#8823])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][383] ([i915#10959])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#8623])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][385] ([i915#8623])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][386] ([i915#12276]) +3 other tests incomplete
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-10/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#11920])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#2437])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-17/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][390] ([i915#2437])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#2437] / [i915#9412]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][392] ([i915#2437])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-rkl:          [PASS][393] -> [FAIL][394] ([i915#10538])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html
    - shard-mtlp:         [PASS][395] -> [FAIL][396] ([i915#10538])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-dg1:          [PASS][397] -> [FAIL][398] ([i915#4349]) +1 other test fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-18/igt@perf_pmu@busy-hang@rcs0.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-12/igt@perf_pmu@busy-hang@rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#8850])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-6/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@render-node-busy@vcs1:
    - shard-mtlp:         [PASS][400] -> [FAIL][401] ([i915#4349]) +2 other tests fail
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-4/igt@perf_pmu@render-node-busy@vcs1.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-6/igt@perf_pmu@render-node-busy@vcs1.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#3708])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#3291] / [i915#3708])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-7/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#3708])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#9917])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][406] ([i915#12910]) +9 other tests fail
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-3/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#9917]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][408] ([i915#12910]) +8 other tests fail
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-mtlp:         NOTRUN -> [SKIP][409] ([i915#4818])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][410] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-10/igt@gem_eio@hibernate.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][412] ([i915#12543] / [i915#5784]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-12/igt@gem_eio@reset-stress.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@deep@bcs0:
    - shard-dg1:          [INCOMPLETE][414] -> [PASS][415] +1 other test pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-13/igt@gem_exec_schedule@deep@bcs0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg1-18/igt@gem_exec_schedule@deep@bcs0.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         [SKIP][416] ([i915#4270]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_softpin@allocator-evict@ccs0:
    - shard-dg2:          [INCOMPLETE][418] -> [PASS][419] +3 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-5/igt@gem_softpin@allocator-evict@ccs0.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-4/igt@gem_softpin@allocator-evict@ccs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][420] -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][422] ([i915#9820]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][424] ([i915#13010]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-6/igt@i915_selftest@live@sanitycheck.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-8/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [DMESG-FAIL][426] ([i915#12964]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-2/igt@i915_suspend@debugfs-reader.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][428] ([i915#1982]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk9/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-glk8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][430] ([i915#11808]) -> [PASS][431] +3 other tests pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [DMESG-WARN][432] ([i915#12917] / [i915#12964]) -> [PASS][433] +1 other test pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][434] ([i915#3555]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-tglu:         [INCOMPLETE][436] -> [PASS][437] +1 other test pass
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-7/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-tglu-5/igt@kms_flip@flip-vs-modeset-vs-hang.html
    - shard-mtlp:         [INCOMPLETE][438] ([i915#6113]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-3/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-mtlp-3/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-rkl:          [FAIL][440] ([i915#11989]) -> [PASS][441] +1 other test pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-rkl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][442] -> [PASS][443] +2 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][444] ([i915#12388]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][446] ([i915#9519]) -> [PASS][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/shard-dg2-10/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          [SKIP][448] ([i915#9519]) -> [PASS][449]
   [448]: h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12328/index.html
