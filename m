Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734FE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 18:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C7710E153;
	Tue, 10 Dec 2024 18:31:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089410E153;
 Tue, 10 Dec 2024 18:31:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_helpers_to_set_CPU_g?=
 =?utf-8?q?overnor_and_GPU_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 18:31:26 -0000
Message-ID: <173385548697.905409.12982315626175529918@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210092119.1556652-1-francois.dugast@intel.com>
In-Reply-To: <20241210092119.1556652-1-francois.dugast@intel.com>
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

Series: Add helpers to set CPU governor and GPU frequency
URL   : https://patchwork.freedesktop.org/series/142341/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8147_full -> IGTPW_12282_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12282_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12282_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12282_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-rkl-2/igt@kms_pm_rpm@pm-caching.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_pm_rpm@pm-caching.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_lease@lease-unleased-connector:
    - {shard-dg2-9}:      NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-9/igt@kms_lease@lease-unleased-connector.html

  
New tests
---------

  New tests have been introduced between IGT_8147_full and IGTPW_12282_full:

### New IGT tests (3) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [2.09, 2.24] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  

Known issues
------------

  Here are the changes found in IGTPW_12282_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +17 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#8414]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#4873]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@gem_caching@reads.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#5882]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][28] ([i915#10030] / [i915#7975] / [i915#8213])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-3/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][29] ([i915#7975] / [i915#8213])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-7/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6334]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6334]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-6/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][33] ([i915#6334]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#5107])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#5107])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#3281]) +6 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3281]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4812])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][46] ([i915#11441]) +1 other test incomplete
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4860]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4860]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4860]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#2190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#2190])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#2190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4613] / [i915#7582])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4613]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#4613])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([i915#4613]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3282]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4077]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@gem_mmap_gtt@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +13 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@gem_mmap_gtt@basic-write.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +12 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_wc@coherency:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4083]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-7/igt@gem_mmap_wc@invalid-flags.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3282]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4270])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@gem_pxp@create-regular-context-2.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-6/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964]) +1 other test timeout
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12917] / [i915#12964])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#8428]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-4/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gem_render_tiled_blits@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4079]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#8411]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [PASS][81] -> [DMESG-FAIL][82] ([i915#12964])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-rkl-3/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#3297] / [i915#3323])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#3323])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#3297] / [i915#3323])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#2856]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#2527]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#2527]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#2856]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +6 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][97] -> [ABORT][98] ([i915#9820])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][99] ([i915#12817] / [i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          NOTRUN -> [ABORT][100] ([i915#9820])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [ABORT][101] ([i915#13218]) +21 other tests abort
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-tglu:         NOTRUN -> [WARN][102] ([i915#2681]) +2 other tests warn
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][103] ([i915#12739] / [i915#3591])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#11681] / [i915#6621])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#11681] / [i915#6621])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#11681])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#11681])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][108] ([i915#9311]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][109] ([i915#9311]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk8/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][110] ([i915#9311]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][111] ([i915#9311]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][112] ([i915#9311]) +1 other test dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-6/igt@i915_selftest@mock@memory_region.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][113] ([i915#9311]) +1 other test dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#5286]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][117] +12 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#5286]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#5286])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#5286])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5286]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3638]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5190]) +9 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#3638])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6187])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#5190]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][127] +22 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#12313])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#12313])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#12313])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#12313])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#12313])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#10307] / [i915#6095]) +71 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#6095]) +72 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6095]) +89 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#12805])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#6095]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6095]) +64 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#6095]) +53 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#6095]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3742])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#7213] / [i915#9010])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#7828]) +10 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#7828]) +7 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#7828]) +9 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#7828]) +9 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_content_protection@atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#6944] / [i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-7/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#9433])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#6944] / [i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#8063] / [i915#9433])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#8814]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3555]) +8 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#13049]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#13049]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#13049]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][162] +318 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk9/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#8814]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#3555]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#13049]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#13049]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#13049])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#9809]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#4213]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#4103]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][172] +17 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#13046] / [i915#5354]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4103] / [i915#4213]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#4103])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#1257])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#1257])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#1257])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3469])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-7/igt@kms_fbcon_fbt@psr.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3955])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3469])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3469])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#1839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#1839])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#1839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#1839])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#658])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#658])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-6/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3637]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#9934]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3637])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#9934]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8381])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9934]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][197] ([i915#12745] / [i915#1982] / [i915#4839])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][198] ([i915#1982] / [i915#4839])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [FAIL][200] ([i915#11989]) +1 other test fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][201] ([i915#12745] / [i915#4839])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][202] ([i915#12745])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#2672] / [i915#8813]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#2672]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#2672]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#2587] / [i915#2672]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#2672] / [i915#3555]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8813])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8810])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#8810] / [i915#8813])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8810])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555] / [i915#8813]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#5274])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#8708]) +13 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-snb:          [PASS][222] -> [SKIP][223] +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#3023]) +18 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3458]) +16 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#1825]) +34 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][227] +42 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +15 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#5439])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3458]) +13 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#1825]) +29 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#8708]) +14 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#5354]) +27 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][235] +298 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][236] +64 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@kms_hdr@bpc-switch.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#12713])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#12713])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#12713])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#12713])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#12713])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12388])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#12388])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#12388])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#10656])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#10656])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#10656])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#10656])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3555]) +10 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_plane_lowres@tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#11614] / [i915#3582]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8821])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3555]) +10 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8821])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#12247] / [i915#9423]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#12247]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#12247]) +29 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#12247]) +22 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#12247] / [i915#6953] / [i915#9423])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12247] / [i915#6953]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#12247]) +15 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#6953])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#12247] / [i915#3555])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12247] / [i915#3555])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#12247] / [i915#3555])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#3555] / [i915#9423])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#12247] / [i915#3555] / [i915#6953])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12247] / [i915#6953])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#12247]) +21 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#5354]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#5354])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#12343])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9812]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-mtlp:         NOTRUN -> [ABORT][282] ([i915#10159] / [i915#13218]) +1 other test abort
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#9685]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#9685]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#8430])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#8430])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#8430])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#8430])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#9519])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#4077] / [i915#4423])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#9519])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#9519])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#6524])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#6524])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#6524])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#6524])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#6524] / [i915#6805])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#11520])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#11520]) +8 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#9808]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][302] ([i915#11520]) +12 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#11520]) +9 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][304] ([i915#11520]) +9 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12316]) +6 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#11520]) +8 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#11520]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#4348]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9683]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#9683]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#9683]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9683]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +15 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#9688]) +14 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9732]) +14 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#9732])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +14 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@kms_psr@psr-cursor-plane-move.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#1072] / [i915#9732]) +15 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#9685]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9685]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][321] ([i915#12964]) +1 other test dmesg-warn
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#5289])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12755] / [i915#5190])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12755]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12755]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][326] ([i915#13179]) +1 other test abort
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][327] ([i915#13179]) +1 other test abort
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb4/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][328] ([i915#13179]) +1 other test abort
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-10/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][329] ([i915#13179]) +1 other test abort
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk6/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][330] ([i915#13179]) +1 other test abort
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][331] ([i915#13179]) +1 other test abort
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#3555] / [i915#8809]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#8623])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#8623])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#3555] / [i915#8808])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#2437])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#2437])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][338] ([i915#2437])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk7/igt@kms_writeback@writeback-check-output.html
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#2437])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-3/igt@kms_writeback@writeback-check-output.html

  * igt@perf@gen12-unprivileged-single-ctx-counters@rcs0:
    - shard-dg1:          NOTRUN -> [ABORT][340] ([i915#13218]) +19 other tests abort
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@perf@gen12-unprivileged-single-ctx-counters@rcs0.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [ABORT][341] ([i915#13218]) +20 other tests abort
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-accuracy-2@rcs0:
    - shard-tglu-1:       NOTRUN -> [ABORT][342] ([i915#13218]) +3 other tests abort
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-1/igt@perf_pmu@busy-accuracy-2@rcs0.html

  * igt@perf_pmu@busy-idle-no-semaphores@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][343] ([i915#13218]) +17 other tests abort
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-glk2/igt@perf_pmu@busy-idle-no-semaphores@rcs0.html

  * igt@perf_pmu@busy-start:
    - shard-rkl:          NOTRUN -> [ABORT][344] ([i915#13218]) +19 other tests abort
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-4/igt@perf_pmu@busy-start.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][345] ([i915#13218]) +16 other tests abort
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb2/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#8516])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#8516])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-9/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#8516])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-mtlp:         NOTRUN -> [ABORT][349] ([i915#13218]) +21 other tests abort
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-8/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][350] ([i915#9351])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][351] ([i915#9351])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#3708]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-mtlp-4/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#3708])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-5/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#3708])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg1-17/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#9917])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#9917])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][357] ([i915#12910]) +9 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
#### Possible fixes ####

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-rkl:          [DMESG-WARN][358] ([i915#12964]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-rkl-4/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-2/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-snb:          [SKIP][360] -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][362] ([i915#12964]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][364] ([i915#10433] / [i915#3458]) -> [SKIP][365] ([i915#3458])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8147/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8147 -> IGTPW_12282

  CI-20190529: 20190529
  CI_DRM_15814: 6966a52cb5531bf6cc785fadba160a71cd31e7aa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12282: b75d66b6b55ff982d4cbdca03f41d9288b78de6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12282/index.html
