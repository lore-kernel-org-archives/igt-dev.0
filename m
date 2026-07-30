Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD53BC55167
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 21:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398A110E07C;
	Thu, 30 Jul 2026 21:48:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740F10E07C;
 Thu, 30 Jul 2026 21:48:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1344729375007111288=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/hwmon=3A_Add?=
 =?utf-8?q?_fan_control_test_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jul 2026 21:48:19 -0000
Message-ID: <178544809939.6473.12659040413343988952@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730170752.3750843-1-karthik.poosa@intel.com>
In-Reply-To: <20260730170752.3750843-1-karthik.poosa@intel.com>
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

--===============1344729375007111288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/hwmon: Add fan control test coverage
URL   : https://patchwork.freedesktop.org/series/171363/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9034_full -> IGTPW_15612_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15612_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15612_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15612_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-mtlp:         [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * {igt@intel_hwmon@fan-curve-setup} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][3] +8 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@intel_hwmon@fan-curve-setup.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][4] +8 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - shard-rkl:          NOTRUN -> [SKIP][5] +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - shard-dg1:          NOTRUN -> [SKIP][6] +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - shard-tglu:         NOTRUN -> [SKIP][7] +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-dg2:          [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_invalid_mode@overflow-vrefresh.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_invalid_mode@overflow-vrefresh.html

  
New tests
---------

  New tests have been introduced between IGT_9034_full and IGTPW_15612_full:

### New IGT tests (9) ###

  * igt@intel_hwmon@fan-curve-setup:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-negative-tests:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-pwm-enable-modes:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-disk:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-mem:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-disk:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-mem:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_15612_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@device_reset@cold-reset-bound.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [PASS][11] -> [SKIP][12] ([i915#2582]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@fbdev@nullptr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@fbdev@nullptr.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#14544] / [i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#4873])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@gem_caching@read-writes.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][19] ([i915#13356] / [i915#16348])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#8562])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8555])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-snb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4812]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4525]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#4525])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#4525])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][39] -> [FAIL][40] ([i915#15816])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-tglu-7/igt@gem_exec_big@single.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][41] ([i915#6334]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#14544] / [i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#14544] / [i915#3281]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +17 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][53] -> [INCOMPLETE][54] ([i915#13356]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613] / [i915#7582])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#14544] / [i915#4613]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#14544] / [i915#3282]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_mmap@bad-object.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4077]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@gem_mmap_gtt@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4077]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_partial_pwrite_pread@reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3282]) +10 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][74] ([i915#14702] / [i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [PASS][76] -> [SKIP][77] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#5190] / [i915#8428]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#8411]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_tiled_pread_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4880]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#4880]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#3297]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3281] / [i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][91] -> [INCOMPLETE][92] ([i915#13356] / [i915#14586])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-glk4/igt@gem_workarounds@suspend-resume.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk6/igt@gem_workarounds@suspend-resume.html
    - shard-rkl:          [PASS][93] -> [INCOMPLETE][94] ([i915#13356]) +1 other test incomplete
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@gem_workarounds@suspend-resume.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          NOTRUN -> [SKIP][95] +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544] / [i915#2527]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#2527]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#14123])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#14123])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#14123])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#14073]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_drm_fdinfo@isolation@rcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#14073]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@i915_drm_fdinfo@isolation@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#14073]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#15479]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][109] ([i915#15342]) +1 other test abort
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#8399])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#14544] / [i915#8399])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][113] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#6590]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#16080] / [i915#16166])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#11681] / [i915#6621])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#11681] / [i915#6621])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#11681] / [i915#6621]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_power@sanity:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#7984])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#14544] / [i915#7984])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#16109])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#5723])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][123] ([i915#4817] / [i915#7443])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#16182] / [i915#4817]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk3/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#4212])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][127] ([i915#14888]) +4 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][128] ([i915#12761]) +1 other test incomplete
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
    - shard-glk11:        NOTRUN -> [INCOMPLETE][129] ([i915#12761]) +1 other test incomplete
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#1769])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][131] ([i915#15662]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5286]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#14544] / [i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#5286]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#5286])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#5286]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][138] -> [FAIL][139] ([i915#15733] / [i915#5138])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3638]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3638]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#3828])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3828])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5190]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#14544] / [i915#3638]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5190])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6187])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6095]) +64 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6095]) +29 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#14098] / [i915#6095]) +49 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6095]) +227 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][153] +612 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][154] +162 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6095]) +19 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#12805])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][160] ([i915#15582]) +1 other test incomplete
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#6095]) +12 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][162] ([i915#15582]) +1 other test incomplete
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#6095]) +98 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#12313])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#14544] / [i915#6095]) +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#6095]) +66 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#3742])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-mtlp:         NOTRUN -> [SKIP][168] +10 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#16464] / [i915#16471])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#16471])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#16471])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#16471]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#16471]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#16471]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#11151] / [i915#7828]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#11151] / [i915#7828]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#11151] / [i915#7828]) +15 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#11151] / [i915#7828]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#11151] / [i915#7828]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#11151] / [i915#7828]) +6 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][182] -> [SKIP][183] ([i915#12655]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_color@ctm-0-25.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_color@ctm-0-25.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#12655] / [i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_color@deep-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3555] / [i915#9979])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          [PASS][186] -> [SKIP][187] ([i915#15529])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15330]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#15330] / [i915#3299])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#15330]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#15330] / [i915#3116])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#15330]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#15330])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#15865]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#15865]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#15865]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#15865]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#15865]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#14544] / [i915#15865])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#13049])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][202] -> [FAIL][203] ([i915#13566]) +2 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [PASS][204] -> [FAIL][205] ([i915#13566]) +3 other tests fail
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#13049])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][207] ([i915#13566])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu-1:       NOTRUN -> [FAIL][208] ([i915#13566]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#8814])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#14544] / [i915#3555])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#16707]) +10 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3555]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3555]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8814]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#13049]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-mtlp:         [PASS][216] -> [DMESG-FAIL][217] ([i915#16175]) +1 other test dmesg-fail
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-1:
    - shard-mtlp:         [PASS][218] -> [FAIL][219] ([i915#13566] / [i915#15733])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-1.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][220] ([i915#12358] / [i915#14152] / [i915#7882])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][221] ([i915#12358] / [i915#14152])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2:          [PASS][222] -> [SKIP][223] ([i915#16707]) +40 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4103]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#4103]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#4103]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#16119] / [i915#4213]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#4103]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#11190] / [i915#16707])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#9809]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#13046] / [i915#5354]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-dg1:          [PASS][232] -> [FAIL][233] ([i915#15999])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9067])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9723])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#1257] / [i915#14544])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#13748]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#13707])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#16361]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#16361]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#16361]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#16361]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#16361]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#16361]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][245] ([i915#9878])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#16680])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#16680])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#16081])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#16600])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#3637] / [i915#9934]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#9934]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#4423] / [i915#9934])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3637] / [i915#9934]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#9934])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#14544] / [i915#9934]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#9934]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#3637] / [i915#9934]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#9934]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
    - shard-dg2:          [PASS][259] -> [FAIL][260] ([i915#14600]) +1 other test fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#5354]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][263] ([i915#12745] / [i915#4839])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][264] ([i915#12745])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#14544] / [i915#15643])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#15643]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#15643]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15643]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2:          [PASS][269] -> [SKIP][270] ([i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#15643])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#15643]) +5 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8813])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#8810] / [i915#8813])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#15643] / [i915#5190]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#15104] / [i915#15990]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#16708] / [i915#5354]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#15991] / [i915#5354]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#15990] / [i915#8708]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] +47 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#15989]) +29 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#15990]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][284] -> [SKIP][285] +10 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][286] +114 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][287] +92 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [PASS][288] -> [SKIP][289] ([i915#15989]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#15989]) +21 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
    - shard-rkl:          NOTRUN -> [ABORT][291] ([i915#15132])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#15102]) +20 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][293] +309 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#15104] / [i915#15990])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#16708] / [i915#5354]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#1825]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#14544]) +19 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#5439])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#5439])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#5439])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][301] +53 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#15989]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#15102]) +36 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#15990]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#15102]) +15 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#15102]) +15 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#5439])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#14544] / [i915#15102]) +5 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#15989]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#15991]) +23 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#16708]) +14 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#15989]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#15989]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#14544] / [i915#15102] / [i915#3023]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#14544] / [i915#1825]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#15990] / [i915#8708]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#15990] / [i915#8708]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#15991] / [i915#1825]) +13 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#15102]) +39 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#15102] / [i915#3023]) +26 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][321] +42 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#15990]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#15991]) +17 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [PASS][324] -> [SKIP][325] ([i915#15725]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#16518] / [i915#3555] / [i915#8228]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8228]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#3555] / [i915#8228]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#3555] / [i915#8228])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#16644] / [i915#3555] / [i915#8228]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#3555]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#13688])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#15460])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#15459]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#15638] / [i915#15722])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#15638] / [i915#15722])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#15815])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#6301])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#6301])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-dg2:          [PASS][340] -> [SKIP][341] ([i915#11190] / [i915#16707]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_pipe_crc_basic@hang-read-crc.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][342] ([i915#12756] / [i915#13409] / [i915#13476])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][343] ([i915#13409] / [i915#13476])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][344] ([i915#118])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#15709]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#16386]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#15709]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#16386]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#15709]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#15709]) +7 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#15709]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#15709]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#16112])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#8825])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][355] ([i915#13026]) +1 other test incomplete
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [PASS][356] -> [INCOMPLETE][357] ([i915#14412]) +1 other test incomplete
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2:          [PASS][358] -> [SKIP][359] ([i915#8825]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][360] ([i915#12178])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][361] ([i915#7862]) +1 other test fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#13958])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#13958] / [i915#14544]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#13958])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#13958])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#13958])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-4/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#13958])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#3555] / [i915#6953] / [i915#9423])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#15329]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [PASS][370] -> [SKIP][371] ([i915#15329] / [i915#3555] / [i915#9423])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          [PASS][372] -> [SKIP][373] ([i915#15329]) +23 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#15329]) +7 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#15329] / [i915#6953])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][376] -> [SKIP][377] ([i915#15329] / [i915#9423]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#15329]) +5 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#12343])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#12343] / [i915#5354])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#12343] / [i915#9812]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#12343] / [i915#5354])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#12343] / [i915#5354]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#14544] / [i915#15948])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#8430])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#8430])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#8430])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#8430])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#8430])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#15073])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#15073] / [i915#4423])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][392] -> [SKIP][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_pm_rpm@i2c.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#15073])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][395] -> [SKIP][396] ([i915#15073]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#15403])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][398] ([i915#6524])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_prime@d3hot.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-dg1:          [PASS][399] -> [DMESG-WARN][400] ([i915#4423])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-15/igt@kms_properties@connector-properties-legacy.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][401] ([i915#11520]) +3 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][402] ([i915#11520]) +14 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][403] ([i915#11520]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#11520]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][405] ([i915#11520]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-snb4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][406] ([i915#11520]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#9808])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][408] ([i915#12316]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#11520] / [i915#14544]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#11520]) +11 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][411] ([i915#11520]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#11520]) +4 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#9683]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#9683])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][416] ([i915#9732]) +18 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][417] ([i915#9688]) +9 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][418] ([i915#1072] / [i915#9732]) +13 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_psr@pr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][419] ([i915#4077] / [i915#9688]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][420] ([i915#9732]) +8 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][421] ([i915#1072] / [i915#9732]) +25 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#1072] / [i915#9732]) +13 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#15949])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][424] ([i915#15949])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#4235])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][426] ([i915#4884])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][427] ([i915#4235])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][428] ([i915#15500] / [i915#16184])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][429] ([i915#12755] / [i915#15867] / [i915#5190])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#5289]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][431] ([i915#3555]) +6 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][432] ([i915#3555]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][433] ([i915#8623]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk10:        NOTRUN -> [FAIL][434] ([i915#10959])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][435] ([i915#12276]) +1 other test incomplete
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#15243] / [i915#3555]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#11920])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][438] ([i915#9906]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][439] ([i915#14544] / [i915#3555] / [i915#9906])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#3555] / [i915#9906])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#3555] / [i915#9906])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][442] ([i915#9906])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#2436])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][444] ([i915#9100]) +1 other test fail
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#2435])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][446] ([i915#2433])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@module-unload:
    - shard-rkl:          NOTRUN -> [ABORT][447] ([i915#15778])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@perf_pmu@module-unload.html
    - shard-snb:          NOTRUN -> [ABORT][448] ([i915#15778])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-snb4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][449] ([i915#13356] / [i915#14242] / [i915#16236])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_udl@share-import:
    - shard-dg2:          NOTRUN -> [SKIP][450] ([i915#16420])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@prime_udl@share-import.html
    - shard-rkl:          NOTRUN -> [SKIP][451] ([i915#16420]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@prime_udl@share-import.html
    - shard-dg1:          NOTRUN -> [SKIP][452] ([i915#16420])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@prime_udl@share-import.html
    - shard-tglu:         NOTRUN -> [SKIP][453] ([i915#16420])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][454] ([i915#3708]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][455] ([i915#3708] / [i915#4077])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][456] ([i915#3291] / [i915#3708])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][457] ([i915#14544] / [i915#3291] / [i915#3708])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][458] ([i915#3708])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@prime_vgem@fence-read-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][459] ([i915#3708])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#9917]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg1:          NOTRUN -> [SKIP][461] ([i915#9917])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [SKIP][462] ([i915#16066]) +8 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-mtlp:         NOTRUN -> [SKIP][463] ([i915#16066]) +8 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][464] ([i915#13356] / [i915#16348]) -> [PASS][465]
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [FAIL][466] ([i915#15454]) -> [PASS][467]
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          [TIMEOUT][468] ([i915#3778]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@gem_exec_endless@dispatch.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@gem_exec_endless@dispatch.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [ABORT][470] ([i915#5566]) -> [PASS][471] +1 other test pass
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [DMESG-WARN][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496]) -> ([PASS][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [PASS][515], [PASS][516], [PASS][517], [PASS][518], [PASS][519], [PASS][520], [PASS][521])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@i915_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@i915_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@i915_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@i915_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@i915_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@i915_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@i915_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@i915_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@i915_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@i915_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@i915_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@i915_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@i915_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@i915_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@i915_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@i915_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@i915_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@i915_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@i915_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@i915_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@i915_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@i915_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@i915_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_module_load@load.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [INCOMPLETE][522] ([i915#4817]) -> [PASS][523]
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@i915_suspend@debugfs-reader.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [ABORT][524] ([i915#15140]) -> [PASS][525]
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-1/igt@i915_suspend@forcewake.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@async-flip-hang:
    - shard-dg2:          [SKIP][526] ([i915#16707]) -> [PASS][527] +24 other tests pass
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_async_flips@async-flip-hang.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_async_flips@async-flip-hang.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [FAIL][528] ([i915#5956]) -> [PASS][529] +1 other test pass
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-dg2:          [SKIP][530] ([i915#15529]) -> [PASS][531]
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][532] ([i915#13566]) -> [PASS][533] +1 other test pass
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][534] ([i915#13566]) -> [PASS][535] +3 other tests pass
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [SKIP][536] ([i915#1849]) -> [PASS][537]
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-dg2:          [SKIP][538] ([i915#9738]) -> [PASS][539]
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_feature_discovery@display-1x.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][540] ([i915#13027]) -> [PASS][541] +1 other test pass
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][542] ([i915#5354]) -> [PASS][543] +2 other tests pass
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-mtlp:         [FAIL][544] ([i915#10826]) -> [PASS][545]
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@d-edp1:
    - shard-mtlp:         [FAIL][546] -> [PASS][547]
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate@d-edp1.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip@plain-flip-fb-recreate@d-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][548] ([i915#16708]) -> [PASS][549]
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][550] ([i915#16708] / [i915#5354]) -> [PASS][551] +2 other tests pass
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][552] ([i915#15989]) -> [PASS][553] +8 other tests pass
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-glk:          [SKIP][554] -> [PASS][555] +4 other tests pass
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [SKIP][556] ([i915#3555]) -> [PASS][557] +4 other tests pass
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_invalid_mode@bad-vsync-end.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-dg2:          [SKIP][558] ([i915#8825]) -> [PASS][559]
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_plane@pixel-format-x-tiled-modifier.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-dg2:          [SKIP][560] ([i915#15329] / [i915#9423]) -> [PASS][561] +1 other test pass
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][562] ([i915#15329] / [i915#6953] / [i915#9423]) -> [PASS][563]
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [SKIP][564] ([i915#15329]) -> [PASS][565] +11 other tests pass
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          [SKIP][566] ([i915#15073]) -> [PASS][567] +2 other tests pass
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][568] ([i915#15073]) -> [PASS][569] +1 other test pass
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [SKIP][570] -> [PASS][571]
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_pm_rpm@system-suspend-idle.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [INCOMPLETE][572] ([i915#14419]) -> [PASS][573]
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-7/igt@kms_pm_rpm@system-suspend-modeset.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][574] ([i915#12276]) -> [PASS][575] +1 other test pass
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  
#### Warnings ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][576] ([i915#3555] / [i915#9323]) -> [SKIP][577] ([i915#14544] / [i915#3555] / [i915#9323])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-1/igt@gem_ccs@block-copy-compressed.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#4525]) -> [SKIP][579] ([i915#4525])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][580] ([i915#14544] / [i915#6344]) -> [SKIP][581] ([i915#6344])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][582] ([i915#3281]) -> [SKIP][583] ([i915#14544] / [i915#3281])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#4613]) -> [SKIP][585] ([i915#4613]) +1 other test skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          [SKIP][586] ([i915#4613]) -> [SKIP][587] ([i915#14544] / [i915#4613])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#3282]) -> [SKIP][589] ([i915#3282])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@gem_pwrite@basic-random.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@gem_pwrite@basic-random.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          [SKIP][590] ([i915#14544] / [i915#2527]) -> [SKIP][591] ([i915#2527])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][592] ([i915#2527]) -> [SKIP][593] ([i915#14544] / [i915#2527])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][594] ([i915#1769] / [i915#3555]) -> [SKIP][595] ([i915#16707])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][596] ([i915#14544] / [i915#5286]) -> [SKIP][597] ([i915#5286])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][598] ([i915#5286]) -> [SKIP][599] ([i915#14544] / [i915#5286])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2:          [SKIP][600] ([i915#16707]) -> [SKIP][601]
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][602] ([i915#3828]) -> [SKIP][603] ([i915#16707])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][604] -> [SKIP][605] ([i915#16707]) +3 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          [SKIP][606] ([i915#14544] / [i915#3638]) -> [SKIP][607] ([i915#3638])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          [SKIP][608] ([i915#4538] / [i915#5190]) -> [SKIP][609] ([i915#16707] / [i915#5190]) +11 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][610] ([i915#16707] / [i915#5190]) -> [SKIP][611] ([i915#5190]) +3 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][612] ([i915#16707] / [i915#5190]) -> [SKIP][613] ([i915#4538] / [i915#5190]) +7 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][614] ([i915#12313]) -> [SKIP][615] ([i915#12313] / [i915#14544])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][616] ([i915#14098] / [i915#6095]) -> [SKIP][617] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][618] ([i915#6095]) -> [SKIP][619] ([i915#14544] / [i915#6095]) +3 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][620] ([i915#12313]) -> [SKIP][621] ([i915#16707]) +1 other test skip
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][622] ([i915#16707]) -> [SKIP][623] ([i915#10307] / [i915#6095]) +8 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
    - shard-rkl:          [SKIP][624] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][625] ([i915#14098] / [i915#6095]) +3 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][626] ([i915#14544] / [i915#6095]) -> [SKIP][627] ([i915#6095]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][628] ([i915#12805]) -> [SKIP][629] ([i915#16707])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-rkl:          [SKIP][630] ([i915#12805]) -> [SKIP][631] ([i915#12805] / [i915#14544])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2:          [SKIP][632] ([i915#6095]) -> [SKIP][633] ([i915#16707])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][634] ([i915#10307] / [i915#6095]) -> [SKIP][635] ([i915#16707]) +9 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][636] ([i915#16017]) -> [SKIP][637] ([i915#16707])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          [SKIP][638] ([i915#16471]) -> [SKIP][639] ([i915#14544] / [i915#16471])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][640] ([i915#11151] / [i915#7828]) -> [SKIP][641] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-dg2:          [SKIP][642] ([i915#15865]) -> [SKIP][643] ([i915#16707])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_content_protection@atomic-hdcp14.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][644] ([i915#15865]) -> [SKIP][645] ([i915#14544] / [i915#15865]) +1 other test skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_content_protection@srm.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][646] ([i915#13049]) -> [SKIP][647] ([i915#16707]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][648] ([i915#16707]) -> [SKIP][649] ([i915#13049])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          [SKIP][650] ([i915#3555]) -> [SKIP][651] ([i915#16707]) +1 other test skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          [SKIP][652] ([i915#13049]) -> [SKIP][653] ([i915#13049] / [i915#4423])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][654] ([i915#4103]) -> [SKIP][655] ([i915#14544] / [i915#4103])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          [SKIP][656] ([i915#16707]) -> [SKIP][657] ([i915#13046] / [i915#5354]) +2 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][658] ([i915#13046] / [i915#5354]) -> [SKIP][659] ([i915#16707]) +6 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][660] ([i915#16707]) -> [SKIP][661] ([i915#4103])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][662] ([i915#16707]) -> [SKIP][663] ([i915#9833])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][664] ([i915#16707]) -> [SKIP][665] ([i915#3555]) +3 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][666] ([i915#8812]) -> [SKIP][667] ([i915#16707])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][668] ([i915#16361]) -> [SKIP][669] ([i915#11190] / [i915#16707])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@kms_dsc@dsc-basic.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          [SKIP][670] ([i915#16707]) -> [SKIP][671] ([i915#16361])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-dg2:          [SKIP][672] ([i915#16361]) -> [SKIP][673] ([i915#16707]) +1 other test skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][674] ([i915#16361]) -> [SKIP][675] ([i915#14544] / [i915#16361]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          [SKIP][676] ([i915#14544] / [i915#16600]) -> [SKIP][677] ([i915#16600])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_feature_discovery@dsc.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-busy-flip:
    - shard-rkl:          [SKIP][678] ([i915#14544] / [i915#9934]) -> [SKIP][679] ([i915#9934])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_flip@2x-busy-flip.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-rkl:          [SKIP][680] ([i915#9934]) -> [SKIP][681] ([i915#14544] / [i915#9934]) +3 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][682] ([i915#15643]) -> [SKIP][683] ([i915#14544] / [i915#15643]) +1 other test skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][684] ([i915#15104] / [i915#15990]) -> [SKIP][685] ([i915#16708])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][686] -> [SKIP][687] ([i915#14544]) +45 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][688] ([i915#14544]) -> [SKIP][689] +17 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][690] ([i915#1825]) -> [SKIP][691] ([i915#14544] / [i915#1825]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][692] ([i915#15991]) -> [SKIP][693] ([i915#16708]) +33 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][694] ([i915#16708]) -> [SKIP][695] ([i915#15991]) +20 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][696] ([i915#16708] / [i915#5354]) -> [SKIP][697] ([i915#15990] / [i915#8708]) +9 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][698] ([i915#15102]) -> [SKIP][699] ([i915#16708]) +16 other tests skip
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][700] ([i915#15102]) -> [SKIP][701] ([i915#10433] / [i915#15102]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][702] ([i915#10433] / [i915#15102]) -> [SKIP][703] ([i915#16708] / [i915#5354])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2:          [SKIP][704] ([i915#16708] / [i915#5354]) -> [SKIP][705] ([i915#15991] / [i915#5354]) +12 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][706] ([i915#15102] / [i915#3023]) -> [SKIP][707] ([i915#14544] / [i915#15102] / [i915#3023]) +11 other tests skip
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][708] ([i915#10433] / [i915#15102]) -> [SKIP][709] ([i915#15102]) +1 other test skip
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-rkl:          [SKIP][710] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][711] ([i915#15102] / [i915#3023])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][712] ([i915#15990]) -> [SKIP][713] ([i915#16708]) +22 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][714] ([i915#10055]) -> [SKIP][715] ([i915#16708])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][716] ([i915#15989]) -> [SKIP][717] ([i915#16708]) +11 other tests skip
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][718] ([i915#16708]) -> [SKIP][719] ([i915#15989]) +6 other tests skip
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt:
    - shard-dg1:          [SKIP][720] ([i915#4423]) -> [SKIP][721]
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][722] ([i915#16708]) -> [SKIP][723] ([i915#15104] / [i915#15990])
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][724] ([i915#15102]) -> [SKIP][725] ([i915#16708] / [i915#5354]) +12 other tests skip
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][726] ([i915#16708] / [i915#5354]) -> [SKIP][727] ([i915#15102]) +8 other tests skip
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][728] ([i915#15990] / [i915#8708]) -> [SKIP][729] ([i915#16708] / [i915#5354]) +12 other tests skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][730] ([i915#14544] / [i915#1825]) -> [SKIP][731] ([i915#1825]) +1 other test skip
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2:          [SKIP][732] ([i915#15991] / [i915#5354]) -> [SKIP][733] ([i915#16708] / [i915#5354]) +29 other tests skip
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][734] ([i915#16708]) -> [SKIP][735] ([i915#15102]) +10 other tests skip
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][736] ([i915#16708]) -> [SKIP][737] ([i915#15990]) +19 other tests skip
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-rkl:          [SKIP][738] ([i915#14544] / [i915#15102]) -> [SKIP][739] ([i915#15102]) +5 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][740] ([i915#15102]) -> [SKIP][741] ([i915#14544] / [i915#15102]) +7 other tests skip
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          [SKIP][742] -> [SKIP][743] ([i915#4423])
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-17/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][744] ([i915#16707]) -> [SKIP][745] ([i915#16518] / [i915#3555] / [i915#8228])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][746] ([i915#12713] / [i915#16490]) -> [SKIP][747] ([i915#1187] / [i915#12713] / [i915#16490])
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          [SKIP][748] ([i915#16707]) -> [SKIP][749] ([i915#12713] / [i915#16518])
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          [SKIP][750] ([i915#12713] / [i915#16644]) -> [SKIP][751] ([i915#14544] / [i915#16644])
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][752] ([i915#12713]) -> [SKIP][753] ([i915#1187] / [i915#12713])
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][754] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][755] ([i915#16707]) +2 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][756] ([i915#6301]) -> [SKIP][757] ([i915#16707])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][758] ([i915#15709]) -> [SKIP][759] ([i915#14544] / [i915#15709])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][760] ([i915#8821]) -> [SKIP][761] ([i915#16707])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          [SKIP][762] ([i915#13958]) -> [SKIP][763] ([i915#16707])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          [SKIP][764] ([i915#16707]) -> [SKIP][765] ([i915#13958])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][766] ([i915#14259]) -> [SKIP][767] ([i915#14259] / [i915#14544])
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          [SKIP][768] ([i915#14259]) -> [SKIP][769] ([i915#16707])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          [SKIP][770] ([i915#13046] / [i915#5354] / [i915#9423]) -> [SKIP][771] ([i915#5354] / [i915#9423])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][772] ([i915#15329]) -> [SKIP][773] ([i915#14544] / [i915#15329]) +3 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][774] ([i915#14544] / [i915#15329] / [i915#3555]) -> [SKIP][775] ([i915#15329] / [i915#3555])
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          [SKIP][776] ([i915#14544] / [i915#15329]) -> [SKIP][777] ([i915#15329]) +2 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [SKIP][778] ([i915#15128]) -> [FAIL][779] ([i915#16479])
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][780] ([i915#15948]) -> [SKIP][781] ([i915#14544] / [i915#15948])
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][782] ([i915#3828]) -> [SKIP][783] ([i915#9340])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          [ABORT][784] ([i915#4423]) -> [SKIP][785]
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][786] ([i915#11520]) -> [SKIP][787] ([i915#11520] / [i915#14544]) +3 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][788] ([i915#11520] / [i915#14544]) -> [SKIP][789] ([i915#11520]) +1 other test skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-rkl:          [SKIP][790] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][791] ([i915#1072] / [i915#9732]) +2 other tests skip
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-blt.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
    - shard-rkl:          [SKIP][792] ([i915#1072] / [i915#9732]) -> [SKIP][793] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-4/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          [SKIP][794] ([i915#12755] / [i915#15867]) -> [SKIP][795] ([i915#16707])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_rotation_crc@bad-pixel-format.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          [SKIP][796] ([i915#5190]) -> [SKIP][797] ([i915#16707] / [i915#5190])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][798] ([i915#14544] / [i915#5289]) -> [SKIP][799] ([i915#5289])
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          [SKIP][800] ([i915#16707]) -> [SKIP][801] ([i915#12755] / [i915#15867]) +1 other test skip
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][802] ([i915#16707]) -> [SKIP][803] ([i915#8623])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          [SKIP][804] ([i915#15243] / [i915#3555]) -> [SKIP][805] ([i915#16707])
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@kms_vrr@flip-basic.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          [SKIP][806] ([i915#16707]) -> [SKIP][807] ([i915#9906])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          [SKIP][808] ([i915#14544] / [i915#9906]) -> [SKIP][809] ([i915#9906])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          [SKIP][810] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][811] ([i915#15243] / [i915#3555])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@kms_vrr@flipline.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          [SKIP][812] ([i915#16707]) -> [SKIP][813] ([i915#11920])
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@kms_vrr@lobf.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][814] ([i915#9906]) -> [SKIP][815] ([i915#16707])
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@kms_vrr@max-min.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_vrr@max-min.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [ABORT][816] ([i915#13029] / [i915#15778]) -> [ABORT][817] ([i915#15778])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg1-16/igt@perf_pmu@module-unload.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][818] ([i915#14544] / [i915#8516]) -> [SKIP][819] ([i915#8516])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9034 -> IGTPW_15612

  CI-20190529: 20190529
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15612: 15612
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html

--===============1344729375007111288==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/hwmon: Add fan control test cove=
rage</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171363/">https://patchwork.freedesktop.org/series/171363/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15612/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15612/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9034_full -&gt; IGTPW_15612_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15612_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_15612_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1561=
2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1561=
2/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> +=
3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-curve-setup} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@intel_hwmon@fan-curve-setup.html=
">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@intel_hwmon@fan-suspend-resume-w=
ith-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@intel_hwmon@fan-suspend-resume-wi=
th-user-table-disk.html">SKIP</a> +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@intel_hwmon@fan-suspend-resume-w=
ith-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@intel_hwmon@fan-suspend-resume-w=
ith-user-table-disk.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_invalid_mode@overflow-vrefresh.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shar=
d-dg2-10/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9034_full and IGTPW_15612_ful=
l:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@intel_hwmon@fan-curve-setup:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-negative-tests:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-pwm-enable-modes:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-disk:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-mem:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-disk:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-mem:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15612_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@gem_caching@read-writes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-comp=
ressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-man=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-snb5/igt@gem_ctx_persistence@processes.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@gem_exec_balancer@parallel-balanc=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-tglu-7/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@g=
em_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk5/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_exec_capture@capture-invisibl=
e@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@gem_exec_flush@basic-wb-ro-before=
-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-befor=
e-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-a=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-=
chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-c=
hain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@gem_exec_schedule@semaphore-powe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/=
igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@gem_fenced_exec_thrash@2-spare-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@gem_fenced_exec_thrash@2-spare-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-ra=
ndom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-ra=
ndom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_mmap@bad-object.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@gem_mmap@basic-small-bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@gem_mmap_gtt@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"=
>i915#4077</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@gem_mmap_gtt@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"=
>i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@gem_mmap_wc@set-cache-level.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_partial_pwrite_pread@reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@gem_partial_pwrite_pread@reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@gem_pwrite@basic-exhaustion.html"=
>WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@gem_pxp@create-regular-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15612/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-no=
t-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@gem_render_copy@linear-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@gem_render_copy@mixed-tiled-to-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@gem_userptr_blits@map-fixed-inval=
idate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-glk4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-glk=
6/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i=
915#14586</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rk=
l-4/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@gen7_exec_parse@basic-offset.html=
">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@gen9_exec_parse@secure-batches.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@gen9_exec_parse@secure-batches.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_drm_fdinfo@all-busy-idle-che=
ck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_drm_fdinfo@isolation@rcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@i915_pm_freq_api@freq-reset-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-a=
ccuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@i915_power@sanity.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">=
i915#7984</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@i915_query@query-topology-known-p=
ci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk3/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_addfb_basic@addfb25-x-tiled-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +4 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_atomic_transition@plane-togg=
le-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_ccs@bad-aux-stride-y-tiled-c=
cs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +227 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +612 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-mc-ccs.html">SKIP</a> +162 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tile=
d-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +66 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_chamelium_color_pipeline@plan=
e-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_chamelium_color_pipeline@plan=
e-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16471">i915#16471</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-withou=
t-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@k=
ms_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12655">i915#12655</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_color@deep-color.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1265=
5">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/sh=
ard-dg2-10/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#155=
29</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/s=
hard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +2 other tests fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/=
shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64=
x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x=
21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/sh=
ard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x64.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175">i91=
5#16175</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15612/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-edp-=
1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13566">i915#13566</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15733">i915#15733</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_cursor_crc@cursor-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pip=
e-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_cursor_edge_walk@256x256-top-edge.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/s=
hard-dg2-10/igt@kms_cursor_edge_walk@256x256-top-edge.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_legacy@basic-flip-bef=
ore-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flip=
b-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-13/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15612/shard-dg1-15/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15999">i915#15999</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257=
">i915#1257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">=
i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-10/igt@kms_fbcon_fbt@psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_feature_discovery@vrr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-m=
odeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/s=
hard-dg2-3/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14=
600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/sha=
rd-dg2-10/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15=
643</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 oth=
er tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 oth=
er tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-li=
near-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-=
linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indf=
b-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-fullscreen.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +29 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-in=
dfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2=
p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-=
2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mm=
ap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-d=
raw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15989">i915#15989</a>) +21 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> +309 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-4/igt@kms_frontbuffer_tracking@hdr-2p-=
primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +23 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) +14 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"=
>i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3023">i915#3023</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-mtlp-1=
/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-4/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644=
">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_invalid_mode@uint-max-clock.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15459">i915#15459</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-6/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-=
dg2-10/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-cr=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-yt=
iled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_plane@pixel-format-x-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-c=
cs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-mo=
difier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane@plane-panning-bottom-r=
ight.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15612/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14412">i915#14412</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-=
dg2-10/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-4/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@invalid-num-sc=
alers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">=
i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe=
-b:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-modifiers@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@plane-sc=
aler-with-clipping-clamping-modifiers@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>)=
 +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-ups=
cale-20x20.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-5-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/150=
73">i915#15073</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_pm_=
rpm@i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8=
/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_prime@d3hot.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i9=
15#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-15/igt@kms_properties@connector-properties-legacy.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5612/shard-dg1-16/igt@kms_properties@connector-properties-legacy.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk3/igt@kms_psr2_sf@fbc-psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-snb4/igt@kms_psr2_sf@fbc-psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-8/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +18 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_psr@pr-primary-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-6/igt@kms_psr@psr-sprite-mmap-gtt@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_psr@psr2-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4235">i915#4235</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-2/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_rotation_crc@multiplane-rotat=
ion-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-=
full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk10/igt@kms_tiled_display@basic-test-patt=
ern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk9/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-3/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-2/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@perf@per-context-mode-unprivileg=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@perf_pmu@module-unload.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5778">i915#15778</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-snb4/igt@perf_pmu@module-unload.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-glk1/igt@perf_pmu@rc6-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14242">i915#14242</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@prime_udl@share-import.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
420">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@prime_udl@share-import.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
420">i915#16420</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-18/igt@prime_udl@share-import.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6420">i915#16420</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-9/igt@prime_udl@share-import.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@prime_vgem@basic-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-7/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@sriov_basic@enable-vfs-bind-unbin=
d-each.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg1-15/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16066">i915#16066</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-mtlp-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +8 other tests skip</l=
i>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0=
-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt=
@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
54">i915#15454</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15612/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@gem_exec_endless@dispatch.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i915#3=
778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15=
612/shard-dg2-8/igt@gem_exec_endless@dispatch.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-glk4/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#55=
66</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_156=
12/shard-glk6/igt@gen9_exec_parse@allowed-all.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9034/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-1/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_9034/shard-dg2-1/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2=
-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_9034/shard-dg2-7/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shar=
d-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_903=
4/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9034/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-3/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_9034/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_9034/shard-dg2-8/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2=
-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_9034/shard-dg2-10/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/sha=
rd-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_903=
4/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_9034/shard-dg2-5/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9034/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-=
dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15612/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shar=
d-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15612/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/s=
hard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15612/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-=
10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1561=
2/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@i915_module_lo=
ad@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i=
915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15612/shard-rkl-2/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-1/igt@i915_suspend@forcewake.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#151=
40</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_156=
12/shard-rkl-7/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_async_flips@async-flip-hang.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15612/shard-dg2-1/igt@kms_async_flips@async-flip-hang.html">PASS</a> +2=
4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transitio=
n@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_atomic_transi=
tion@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
529">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-dg2-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_cursor_crc@cursor-onscre=
en-256x85@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15612/shard-tglu-7/igt@kms_cursor_crc@cursor-random=
-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#184=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1561=
2/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_feature_discovery@display-1x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i=
915#9738</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15612/shard-dg2-3/igt@kms_feature_discovery@display-1x.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15612/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-=
interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptib=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_flip@flip-vs-dpms-off-vs-mod=
eset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i=
915#10826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15612/shard-mtlp-5/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate@d-edp1.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612=
/shard-mtlp-5/igt@kms_flip@plain-flip-fb-recreate@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-sh=
rfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer=
_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuffer_tra=
cking@fbc-rgb565-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indf=
b-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> +8 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb=
-fullscreen.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15612/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndsc=
rn-spr-indfb-fullscreen.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15612/shard-dg2-8/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> +4 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_plane@pixel-format-x-tiled-modifier.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-dg2-8/igt@kms_plane@pixel-format-x-tiled-modifier.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale=
-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2=
-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale=
-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_plane_scal=
ing@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +11 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15612/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-d=
g2-3/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-7/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-=
2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_vblank@ts-continuatio=
n-suspend@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-fi=
rst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15612/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15612/shard-rkl-7/igt@gem_lmem_swapping@heavy-random.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-rkl-8/igt@gem_pwrite@basic-random.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915=
#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-rkl-2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i9=
15#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15612/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-1=
0/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-p=
anels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-offset-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707"=
>i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15612/shard-dg2-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_big_fb@linear-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/sha=
rd-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) +3 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15612/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-=
async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c=
-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@b=
ad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe=
-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@ccs-on-another-=
bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15612/shard-dg2-1/igt@kms_ccs@crc-primary-basic-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests sk=
ip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_c=
cs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-c=
cs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12805">i915#12805</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-cc=
s-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_ccs@crc-s=
prite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +9 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/160=
17">i915#16017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15612/shard-dg2-10/igt@kms_cdclk@mode-transition-all-outputs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm=
3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16471">i915#16471</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_color_pipeline@=
plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc=
-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_content_protection@atomic-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15612/shard-dg2-10/igt@kms_content_protection@atomic-hdcp14.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15=
865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15=
612/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15612/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movemen=
t-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_cursor_legacy@c=
ursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-=
toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_cursor_legacy@short-bu=
sy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15612/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#=
9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15612/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i9=
15#8812</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_15612/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard=
-dg2-10/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15612/shard-dg2-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#163=
61</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i=
915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15612/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361"=
>i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15612/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-rkl-5/igt@kms_feature_discovery@dsc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600"=
>i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/993=
4">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_15612/shard-rkl-7/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#99=
34</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_156=
12/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934=
">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@=
kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pl=
flip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn=
-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-3/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer=
_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-8/igt@kms_frontbuffer_trac=
king@fbchdr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +20=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptra=
ck-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15=
990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a=
>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-4/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">=
i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-i=
ndfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/i=
gt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#=
15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5354">i915#5354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i9=
15#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3023">i915#3023</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_frontbuffer=
_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprima=
ry.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@=
kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3023">i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-p=
ri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_front=
buffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
8">i915#16708</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-ti=
ling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_=
tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuffer_track=
ing@hdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15612/shard-dg1-16/igt@kms_frontbuffer_tracking=
@hdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-7/igt@kms_frontbuffer_=
tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-5/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15=
102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@k=
ms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@km=
s_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_front=
buffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54">i915#5354</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-3/igt@kms_frontbuf=
fer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i91=
5#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-6/igt@kms_frontbuffe=
r_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15=
990</a>) +19 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-7/igt=
@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_frontbuffer_trackin=
g@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-17/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-=
shrfb-draw-pwrite.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15612/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhd=
r-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5612/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#=
12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16490">i915#16490</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15612/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1187">i915#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#=
16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15612/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16518">i915#16518</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#1=
2713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16644">i915#16644</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16644">i915#16644</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#=
12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15612/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915=
#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_15612/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifie=
r-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane@pixel=
-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612=
/shard-dg2-10/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_15612/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915=
#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i9=
15#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15612/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915=
#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#1=
4259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5612/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#1=
4259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5612/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_plane_scalin=
g@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard=
-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/=
igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15329">i915#15329</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/sha=
rd-tglu-10/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard=
-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shar=
d-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#442=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1561=
2/shard-dg1-14/igt@kms_pm_rpm@pc8-residency.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_psr2_sf=
@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15612/shard-rkl-2/igt@kms_psr@fbc-psr-sprite-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-4/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15612/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">=
i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15612/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-refle=
ct-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_15612/shard-rkl-4/igt@kms_rotation_crc@prima=
ry-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1670=
7">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15612/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
07">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15612/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15612/shard-dg2-10/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5612/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>=
)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15612/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15612/shard-rkl-8/igt@kms_vrr@flipline.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i91=
5#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-10/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2=
-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg2-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/shard-dg2=
-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-dg1-16/igt@perf_pmu@module-unload.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#130=
29</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15778">i915#15778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15612/shard-dg1-19/igt@perf_pmu@module-unload.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">=
i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9034/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15612/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9034 -&gt; IGTPW_15612</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_15612: 15612<br />
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1344729375007111288==--
