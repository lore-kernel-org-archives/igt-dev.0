Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B1ECEF17C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 14:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1039A10E550;
	Tue,  8 Oct 2024 14:12:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BDF10E551;
 Tue,  8 Oct 2024 14:12:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6080913517243006063=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/core=5Fsetmaster=3A_s?=
 =?utf-8?q?implify_device_handling_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Oct 2024 14:12:03 -0000
Message-ID: <172839672351.1204360.16092725712774951713@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004165745.16799-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20241004165745.16799-1-krishnaiah.bommu@intel.com>
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

--===============6080913517243006063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_setmaster: simplify device handling (rev3)
URL   : https://patchwork.freedesktop.org/series/139518/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15485_full -> IGTPW_11874_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11874_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11874_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11874_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr2-cursor-mmap-gtt@edp-1:
    - shard-mtlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-4/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html

  * igt@sysfs_timeslice_duration@timeout:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@sysfs_timeslice_duration@timeout.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15485_full and IGTPW_11874_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  

Known issues
------------

  Here are the changes found in IGTPW_11874_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#6230])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#9318])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [PASS][8] -> [ABORT][9] ([i915#5507])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8414]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@drm_fdinfo@isolation.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@drm_fdinfo@isolation.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#3936])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3936])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#3936])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#8562])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#11980])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-1/igt@gem_ctx_persistence@hostile.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][22] ([i915#1099])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#280]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][26] -> [ABORT][27] ([i915#7975] / [i915#8213])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-19/igt@gem_eio@hibernate.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#4525])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#6344])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-tglu:         NOTRUN -> [FAIL][30] ([i915#2842]) +3 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][31] -> [FAIL][32] ([i915#2842]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_exec_reloc@basic-write-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4537])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@pi-ringfull@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][42] ([i915#12296]) +5 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_exec_schedule@pi-ringfull@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#7276])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4537] / [i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [PASS][47] -> [ABORT][48] ([i915#7975] / [i915#8213]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4860]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#2190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4613]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4613]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4077]) +10 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4077]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +11 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@read:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4083]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3282])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4270]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4270]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_pxp@reject-modify-context-protection-off-1.html
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4270]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4270])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8428]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190] / [i915#8428]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4079])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4079])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4885])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4885])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3282] / [i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_userptr_blits@forbidden-operations.html
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3282] / [i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3282] / [i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3282] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4880]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#4880])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][90] +10 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#2527]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#2856]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4881])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@i915_fb_tiling.html

  * igt@i915_module_load@load:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#6227])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][97] -> [ABORT][98] ([i915#9820])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][99] -> [ABORT][100] ([i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#6412])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#7091])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#8436])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#6590]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][106] ([i915#2681]) +1 other test warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][107] -> [FAIL][108] ([i915#3591]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11681])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@i915_pm_rps@thresholds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          [PASS][110] -> [DMESG-WARN][111] ([i915#4391] / [i915#4423])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-19/igt@i915_suspend@basic-s3-without-i915.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4212]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4215] / [i915#5190])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4215])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#8709]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8709]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#6228])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6228])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-dg2:          [PASS][121] -> [SKIP][122] ([i915#9197]) +13 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-4/igt@kms_atomic@plane-cursor-legacy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         NOTRUN -> [FAIL][123] ([i915#11808]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#5286]) +6 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5286]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][130] ([i915#5138])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3638])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3638])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#5190] / [i915#9197])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5190]) +15 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#5190])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][136] +26 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#12313]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6095]) +24 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#12313]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#12313]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#10307] / [i915#6095]) +171 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#6095]) +104 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#12313]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +59 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +70 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7213]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3742])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4087]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][152] +23 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#7828]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#7828]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +9 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#7828]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3299])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3299]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3299])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3116])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7118])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#7116])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#6944])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7118] / [i915#9424]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7118] / [i915#9424])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#7116] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#6944] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#11453]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#11453]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#11453]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#3555] / [i915#8814]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#3555]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3555]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#11453])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#9809]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-snb:          [PASS][180] -> [SKIP][181] +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [PASS][182] -> [FAIL][183] ([i915#2346])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#9067])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#4103] / [i915#4213])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#4103]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#4213])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#9833])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9723])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#9723])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3804])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#8812])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#3840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840] / [i915#9053])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#1839])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#658])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#658])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#658])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3637] / [i915#3966]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3637]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3637]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#8381]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8381]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#9934]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][208] -> [FAIL][209] ([i915#2122]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:
    - shard-dg1:          [PASS][210] -> [FAIL][211] ([i915#79]) +1 other test fail
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8381])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][213] -> [INCOMPLETE][214] ([i915#4839] / [i915#6113])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][215] ([i915#6113])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-dg2:          [PASS][216] -> [SKIP][217] ([i915#5354]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-4/igt@kms_flip@plain-flip-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [PASS][218] -> [FAIL][219] ([i915#2122]) +5 other tests fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [PASS][220] -> [FAIL][221] ([i915#11989] / [i915#2122])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][222] ([i915#2122])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [PASS][223] -> [FAIL][224] ([i915#2122])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
    - shard-rkl:          [PASS][225] -> [FAIL][226] ([i915#11961]) +1 other test fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672] / [i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672] / [i915#3555])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#2587] / [i915#2672]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +4 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8813])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#8810])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#2672]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#8708]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#5354]) +44 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8708]) +24 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][245] +36 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1825]) +33 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3458]) +15 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3458]) +15 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#5439])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3023]) +24 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][251] +103 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#1825]) +11 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#8708]) +24 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#6118])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][255] -> [SKIP][256] ([i915#3555] / [i915#8228])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#10656]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#10656]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#10656]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#10656]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#10656]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#9197]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#6301]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#6301])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#7294])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#8821])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8821])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8821])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][271] ([i915#8292]) +1 other test fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][272] ([i915#8292])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-dg2:          [PASS][273] -> [SKIP][274] ([i915#8152] / [i915#9423])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#12247]) +6 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#12247] / [i915#6953])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#12247]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#12247]) +17 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#8152])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#6953])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12247] / [i915#6953])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#12247]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#6953])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [PASS][287] -> [SKIP][288] ([i915#6953] / [i915#8152] / [i915#9423])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#12247] / [i915#3555] / [i915#9423])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#12247]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#8152]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12247]) +7 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][296] +90 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#8152])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#5354])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#5978])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#3361])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][301] -> [SKIP][302] ([i915#9340])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#9340])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#8430])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#9519])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#9519])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][309] -> [SKIP][310] ([i915#9519])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          [PASS][311] -> [SKIP][312] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#9519])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9519])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#6524] / [i915#6805]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#6524]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#6524])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][319] ([i915#11520])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12316]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#9808])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#11520]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#11520]) +9 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#11520]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#11520]) +5 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#9683])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#9683])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#1072] / [i915#9732]) +20 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#9732]) +26 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#9688]) +14 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#1072] / [i915#9732]) +27 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#1072] / [i915#9732]) +18 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#9685])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#5289])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#5289])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#5289])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#5289])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][338] ([i915#12231]) +1 other test abort
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-rkl:          [PASS][339] -> [FAIL][340] ([i915#5465])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@kms_setmode@basic.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][341] ([i915#5465]) +1 other test fail
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#8623])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#8623])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed:
    - shard-dg1:          [PASS][344] -> [DMESG-WARN][345] ([i915#4423])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@kms_universal_plane@universal-plane-pageflip-windowed.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_universal_plane@universal-plane-pageflip-windowed.html

  * igt@kms_vrr@flip-basic:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#3555]) +5 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#11920])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#3555] / [i915#9906])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#3555] / [i915#9906])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#9906])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#9906]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#9906])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#2437])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#2437])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#2437] / [i915#9412])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#2437] / [i915#9412])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#2435])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][360] -> [FAIL][361] ([i915#4349]) +4 other tests fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][362] -> [FAIL][363] ([i915#11943]) +1 other test fail
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-dg1:          [PASS][364] -> [FAIL][365] ([i915#11943]) +1 other test fail
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-mtlp:         [PASS][366] -> [FAIL][367] ([i915#11943]) +1 other test fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][368] ([i915#9351])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][369] ([i915#9351])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3291] / [i915#3708]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#3708]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#3708] / [i915#4077])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#3708] / [i915#4077])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#3708] / [i915#4077])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#3708]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#3708]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#3708])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#9917])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#9917])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][380] ([i915#9781])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-dg1:          NOTRUN -> [FAIL][381] ([i915#9781])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][382] ([i915#12027]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglu:         [FAIL][384] ([i915#12027]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][386] ([i915#5784]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@gem_eio@kms.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][388] ([i915#5784]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][390] ([i915#11713]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-5/igt@gem_exec_big@single.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [ABORT][392] ([i915#11703]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb5/igt@i915_module_load@reload-no-display.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          [FAIL][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@i915_pm_rps@waitboost.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@i915_pm_rps@waitboost.html
    - shard-dg1:          [FAIL][396] -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@i915_pm_rps@waitboost.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@i915_pm_rps@waitboost.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-dg1:          [INCOMPLETE][398] ([i915#2295]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-13/igt@kms_addfb_basic@bad-pitch-999.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][400] ([i915#5138]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          [DMESG-WARN][402] ([i915#4423]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-rkl:          [ABORT][404] ([i915#10354]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_busy@basic:
    - shard-dg2:          [SKIP][406] ([i915#9197]) -> [PASS][407] +15 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_busy@basic.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@forked-bo:
    - shard-dg1:          [INCOMPLETE][408] -> [PASS][409] +1 other test pass
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-13/igt@kms_cursor_legacy@forked-bo.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_cursor_legacy@forked-bo.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-snb:          [FAIL][410] ([i915#2122]) -> [PASS][411] +3 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-tglu:         [FAIL][412] ([i915#2122]) -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg2:          [SKIP][414] ([i915#3555]) -> [PASS][415] +3 other tests pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][416] ([i915#5354]) -> [PASS][417] +4 other tests pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [SKIP][418] -> [PASS][419] +4 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2:          [SKIP][420] ([i915#8825]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-dg2:          [SKIP][422] ([i915#7294]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          [SKIP][424] ([i915#8152] / [i915#9423]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:
    - shard-dg2:          [SKIP][426] ([i915#12247]) -> [PASS][427] +5 other tests pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][428] ([i915#8152]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-dg2:          [SKIP][430] ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:
    - shard-dg2:          [SKIP][432] ([i915#12247] / [i915#8152]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][434] ([i915#4281]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][436] ([i915#9519]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][438] ([i915#9519]) -> [PASS][439] +2 other tests pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-dg2:          [SKIP][440] ([i915#11521]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_properties@crtc-properties-atomic.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_properties@crtc-properties-atomic.html

  * igt@perf@blocking:
    - shard-mtlp:         [FAIL][442] -> [PASS][443] +1 other test pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-4/igt@perf@blocking.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@perf@blocking.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][444] -> [SKIP][445] ([i915#9197]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][446] ([i915#9197]) -> [SKIP][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_big_fb@x-tiled-8bp

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/index.html

--===============6080913517243006063==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/core_setmaster: simplify device handling (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139518/">https://patchwork.freedesktop.org/series/139518/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15485_full -&gt; IGTPW_11874_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11874_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11874_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11874_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-4/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@kms_psr@psr2-cursor-mmap-gtt@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@sysfs_timeslice_duration@timeout.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15485_full and IGTPW_11874_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc@cursor-size-hints@pipe-a-vga-1:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11874_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@drm_fdinfo@isolation.html">SKIP</a> ([i915#8414]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@drm_fdinfo@isolation.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-1/igt@gem_ctx_persistence@hostile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-19/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@gem_exec_fair@basic-none-solo.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> ([i915#4537])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_exec_schedule@pi-ringfull@rcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> ([i915#4077]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_mmap_wc@read.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-8/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#8436])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@i915_pm_rps@thresholds.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-19/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WARN</a> ([i915#4391] / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html">SKIP</a> ([i915#8709]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-4/igt@kms_atomic@plane-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_atomic@plane-cursor-legacy.html">SKIP</a> ([i915#9197]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> ([i915#11808]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190] / [i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +171 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7116])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([i915#3637] / [i915#3966]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([i915#3637]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4.html">FAIL</a> ([i915#79]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> ([i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-4/igt@kms_flip@plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> ([i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#2122]) +5 other tests fail</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#11989] / [i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#11961]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#5354]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1825]) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#3023]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#1825]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-10/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#9197]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> ([i915#12247]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> ([i915#12247]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-d.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html">SKIP</a> +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-4/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#12316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> ([i915#9732]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> ([i915#9688]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-17/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@kms_universal_plane@universal-plane-pageflip-windowed.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@kms_vrr@flip-basic.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#2435])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html">WARN</a> ([i915#9351])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> ([i915#9351])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-5/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-19/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-6/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-4/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-5/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-5/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb5/igt@i915_module_load@reload-no-display.html">ABORT</a> ([i915#11703]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb1/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@i915_pm_rps@waitboost.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@i915_pm_rps@waitboost.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@i915_pm_rps@waitboost.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-13/igt@kms_addfb_basic@bad-pitch-999.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-12/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-12/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-14/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">ABORT</a> ([i915#10354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_busy@basic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-4/igt@kms_busy@basic.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg1-13/igt@kms_cursor_legacy@forked-bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg1-18/igt@kms_cursor_legacy@forked-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html">SKIP</a> ([i915#8825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_alpha_blend@constant-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-7/igt@kms_properties@crtc-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-mtlp-4/igt@perf@blocking.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-mtlp-6/igt@perf@blocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-11/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11874/shard-dg2-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15485/shard-dg2-2/igt@kms_big_fb@x-tiled-8bp">SKIP</a> ([i915#9197]) -&gt; [SKIP][447]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6080913517243006063==--
