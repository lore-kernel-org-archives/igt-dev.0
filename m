Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CBDE74AC2
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 16:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD910EA9A;
	Tue,  3 Dec 2024 16:34:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F1210EA9A;
 Tue,  3 Dec 2024 16:34:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/gem=5Fctx=5F?=
 =?utf-8?q?param=3A_Add_GTT_size_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Dec 2024 16:34:27 -0000
Message-ID: <173324366713.2060734.9034171101859812830@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
In-Reply-To: <wwioetfbvnmnwoe2oqzy6dzl35vtll6agmn2vz746ibpprdl4o@mhw2tembwbp6>
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

Series: tests/intel/gem_ctx_param: Add GTT size test
URL   : https://patchwork.freedesktop.org/series/142041/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8136_full -> IGTPW_12234_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12234_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12234_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12234_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-mtlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-glk:          NOTRUN -> [ABORT][2] +5 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [ABORT][3] +9 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglu-1:       NOTRUN -> [ABORT][6] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [ABORT][7] +11 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [ABORT][8] +9 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [ABORT][9] +6 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@enable-race:
    - shard-dg2:          NOTRUN -> [ABORT][10] +5 other tests abort
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@perf_pmu@enable-race.html

  
#### Warnings ####

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [ABORT][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-rkl-5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_balancer@bonded-false-hang:
    - {shard-dg2-9}:      NOTRUN -> [ABORT][13] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-9/igt@gem_exec_balancer@bonded-false-hang.html

  
New tests
---------

  New tests have been introduced between IGT_8136_full and IGTPW_12234_full:

### New IGT tests (1) ###

  * igt@gem_ctx_param@gtt-size:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_12234_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#6230])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#6230])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#9318])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@debugfs_test@basic-hwmon.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#9318])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8414]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8414]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-1/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-tglu-1:       NOTRUN -> [ABORT][31] ([i915#13218])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_balancer@invalid-balancer:
    - shard-mtlp:         NOTRUN -> [ABORT][32] ([i915#13218]) +2 other tests abort
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_exec_balancer@invalid-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#4525]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][35] ([i915#11965]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][36] ([i915#11965]) +4 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][37] ([i915#11965]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3539])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#5107])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +10 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4537] / [i915#4812]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][47] ([i915#11441]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4860]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4613]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-9/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#4613]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk4/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#4613])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4077]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +15 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4077]) +17 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3282]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3282]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-1/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][68] ([i915#12964])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4270]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4270]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-8/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][71] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#13033])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190] / [i915#8428]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4079]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#8411]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4079]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][78] ([i915#12964])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@gem_userptr_blits@coherency-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297] / [i915#4880]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4880]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#4958])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297] / [i915#4958])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-tglu-1:       NOTRUN -> [SKIP][87] +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][88] +19 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          NOTRUN -> [ABORT][89] ([i915#5566])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#2527]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#2527]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#2527] / [i915#2856])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][96] ([i915#9820])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#6412])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#7178])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#6412])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#8399])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-9/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#6590]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg1:          [PASS][103] -> [DMESG-WARN][104] ([i915#4423])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-14/igt@i915_pm_rpm@system-suspend-execbuf.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@engine-order:
    - shard-dg1:          NOTRUN -> [ABORT][105] ([i915#13218]) +19 other tests abort
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#11681]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#11681]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#7707])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#7707])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-2/igt@intel_hwmon@hwmon-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#7707])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4212])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#12454] / [i915#12712])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#12454] / [i915#12712])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#9531])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#9531])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#9531])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#9531])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#5286]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4538] / [i915#5286]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#5286]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3638]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3638])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#5190]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5190]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6095]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#12313])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#12313])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#12313])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#12313])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#6095]) +45 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][132] +211 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#6095]) +44 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#12805])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#12805])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#6095]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#6095]) +78 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#6095]) +9 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#10307] / [i915#6095]) +49 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#7828]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-1/igt@kms_chamelium_audio@dp-audio-edid.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#7828]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_chamelium_audio@dp-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#7828]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][143] +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#7828]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#7828]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3299])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7118] / [i915#9424])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_content_protection@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7116] / [i915#9424])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#3555]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3555]) +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#13049])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#13049]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#13049])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3555]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4103] / [i915#4213])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4103] / [i915#4213])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#9809]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#9067])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#9067])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#9067])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#9067])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#4103])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#4103])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][164] ([i915#12964]) +9 other tests dmesg-warn
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3555] / [i915#3804])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#1769] / [i915#3555] / [i915#3804])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3804])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3804])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3555] / [i915#3840])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3555] / [i915#3840])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3955])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3469])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3469])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#3637])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [PASS][175] -> [FAIL][176] ([i915#11989]) +2 other tests fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#9934]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#9934]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#9934]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3637]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][181] ([i915#1982] / [i915#4839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][182] ([i915#12745] / [i915#1982])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#2672]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#2587] / [i915#2672] / [i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#2672] / [i915#3555]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#2672] / [i915#3555]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#2587] / [i915#2672]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#2587] / [i915#2672]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#2672] / [i915#3555] / [i915#5190])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#2672]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#1825]) +33 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][194] +35 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#10433] / [i915#3458])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8708]) +15 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#5354]) +26 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][198] +67 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3458]) +16 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#5439])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#5439])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#10055])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3023]) +24 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3458]) +14 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#1825]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8708]) +16 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#8228])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_hdr@invalid-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_hdr@invalid-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8228])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8228]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#12394])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#12394])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#4816])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#4816])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#1839])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#1839])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][217] ([i915#8292]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#6953] / [i915#9423])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#6953])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#6953])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#12247] / [i915#9423])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#12247]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#12247]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#12247]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#12247]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#12247] / [i915#6953])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#12247]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#5354])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#4281])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#8430])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#9519]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#9519])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][233] +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#6524] / [i915#6805])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#6524])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][236] ([i915#11520]) +10 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#11520]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#11520]) +5 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][239] ([i915#11520]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#12316])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#11520]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#11520]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#9683])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#9683])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9683]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#1072] / [i915#9732]) +22 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#9732]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-1/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9732]) +17 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#9688]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1072] / [i915#9732]) +20 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#1072] / [i915#9732]) +17 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-snb:          NOTRUN -> [SKIP][252] +372 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb7/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#9685])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9685])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#4884])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#4235])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#5289])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#5289])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#5289]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#5289]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sequence@queue-idle:
    - shard-rkl:          [PASS][261] -> [DMESG-WARN][262] ([i915#12964]) +1 other test dmesg-warn
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-rkl-3/igt@kms_sequence@queue-idle.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_sequence@queue-idle.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3555]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([IGT#160])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][265] ([IGT#160] / [i915#6493])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#8623])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#8623])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][268] ([i915#12276]) +1 other test incomplete
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#9906])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9906])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-7/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9906])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#2437]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-4/igt@kms_writeback@writeback-check-output.html
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#2437])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-5/igt@kms_writeback@writeback-check-output.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#2437]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#2437])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-3/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][276] ([i915#2437])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk4/igt@kms_writeback@writeback-check-output.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          NOTRUN -> [ABORT][277] ([i915#13218]) +19 other tests abort
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@perf@low-oa-exponent-permissions.html

  * igt@perf_pmu@busy-check-all:
    - shard-snb:          NOTRUN -> [ABORT][278] ([i915#13218]) +12 other tests abort
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-snb2/igt@perf_pmu@busy-check-all.html

  * igt@perf_pmu@busy-check-all@rcs0:
    - shard-tglu:         NOTRUN -> [ABORT][279] ([i915#13218]) +17 other tests abort
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@perf_pmu@busy-check-all@rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#8850])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@idle:
    - shard-rkl:          NOTRUN -> [ABORT][281] ([i915#13218]) +19 other tests abort
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-2/igt@perf_pmu@idle.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#8516])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#8516])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#8516])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#8516])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][286] ([i915#13218]) +17 other tests abort
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-glk4/igt@perf_pmu@render-node-busy@rcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3291] / [i915#3708])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-5/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#3291] / [i915#3708])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#3708]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3708])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3708])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#9917])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg2-6/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9917])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-rkl-4/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#9917])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][295] ([i915#12910]) +9 other tests fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-tglu-6/igt@sriov_basic@bind-unbind-vf@vf-4.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - shard-dg1:          ([PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [DMESG-WARN][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317]) ([i915#4423]) -> ([PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-13/igt@i915_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-18/igt@i915_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-13/igt@i915_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-18/igt@i915_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-14/igt@i915_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-14/igt@i915_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-13/igt@i915_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-17/igt@i915_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-17/igt@i915_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-17/igt@i915_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-13/igt@i915_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-17/igt@i915_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-18/igt@i915_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-14/igt@i915_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-17/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-12/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8136/shard-dg1-13/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-12/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-17/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-14/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-13/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/shard-dg1-18/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13033
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8136 -> IGTPW_12234

  CI-20190529: 20190529
  CI_DRM_15778: 5779fb3c12faf12589054127d60b1d36d56ba219 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12234: 9e35f1aaad473ece4c5e63893f99efbe0ee32f93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8136: 21076ee09438af484c58b308d8179277503922f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12234/index.html
