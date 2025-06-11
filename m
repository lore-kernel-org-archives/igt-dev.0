Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E4C71135
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 22:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E19910E740;
	Wed, 11 Jun 2025 22:10:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C49510E740;
 Wed, 11 Jun 2025 22:10:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6460603828506416122=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fvm=3A_F?=
 =?utf-8?q?ix_skip_condition_to_account_for_padded_BO_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jun 2025 22:10:09 -0000
Message-ID: <174967980953.69215.16150128886513662921@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611100158.15197-1-lukasz.laguna@intel.com>
In-Reply-To: <20250611100158.15197-1-lukasz.laguna@intel.com>
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

--===============6460603828506416122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Fix skip condition to account for padded BO size
URL   : https://patchwork.freedesktop.org/series/150086/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16685_full -> IGTPW_13272_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13272_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13272_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13272_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-mtlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-5/igt@kms_psr@psr2-cursor-render@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_psr@psr2-cursor-render@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_13272_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2-9:        NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2-9:        NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#4873])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#6335])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2-9:        NOTRUN -> [SKIP][12] ([i915#8562])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#5882]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-dg1:          [PASS][16] -> [DMESG-WARN][17] ([i915#4391] / [i915#4423])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-12/igt@gem_eio@in-flight-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][18] ([i915#4812]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#4525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#4525]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#4525]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][22] ([i915#11965]) +4 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4812]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2-9:        NOTRUN -> [SKIP][26] +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][27] +15 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#3281]) +10 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3281])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-dg2-9:        NOTRUN -> [SKIP][31] ([i915#3281]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3281]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2-9:        NOTRUN -> [SKIP][33] ([i915#4537] / [i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4860])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][36] ([i915#4860])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4860]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#4613] / [i915#7582])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4613]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4613]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][42] ([i915#4613]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][43] -> [TIMEOUT][44] ([i915#5493]) +1 other test timeout
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2-9:        NOTRUN -> [SKIP][46] ([i915#4077]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4077]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4083])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#4083]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4083]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4083]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2-9:        NOTRUN -> [SKIP][52] ([i915#3282]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3282]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3282]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][55] ([i915#2658])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][56] ([i915#12964])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html
    - shard-dg2-9:        NOTRUN -> [SKIP][57] ([i915#4270])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [PASS][58] -> [TIMEOUT][59] ([i915#12917] / [i915#12964])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@gem_pxp@display-protected-crc.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][62] ([i915#12917] / [i915#12964])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#5190] / [i915#8428]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#8428]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4885])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][67] ([i915#13809])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4079]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4879])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2-9:        NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3297])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2-9:        NOTRUN -> [SKIP][73] ([i915#3297] / [i915#4880])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297] / [i915#4880]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3297]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#2527] / [i915#2856])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#2527]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2527]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][81] ([i915#14123])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#14123])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][83] ([i915#11527]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@busy-idle-check-all@ccs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][84] ([i915#14118])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#14118])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#8399])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][87] +26 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][88] ([i915#12797])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk9/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2-9:        NOTRUN -> [SKIP][89] ([i915#11681] / [i915#6621])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4387])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#4387])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#6245])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#5723])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [PASS][94] -> [DMESG-FAIL][95] ([i915#12061]) +1 other test dmesg-fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@i915_selftest@live@workarounds.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#6645])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][97] ([i915#4817])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#7707])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4212])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4212])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#8709]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8709]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-9:        NOTRUN -> [SKIP][103] ([i915#12967] / [i915#6228])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#12967])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2-9:        NOTRUN -> [SKIP][105] ([i915#9531])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#1769] / [i915#3555])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2-9:        NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#5286]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#5286]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#5286]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3638])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3638]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-9:        NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5190]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#5190]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5190]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#5190])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#6095]) +34 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#12313]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#6095]) +143 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][121] ([i915#10307] / [i915#6095]) +19 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][122] +398 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#6095]) +39 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#6095]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#12313])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#10307] / [i915#6095]) +170 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#12313])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#12805])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-9:        NOTRUN -> [SKIP][129] ([i915#12805])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#12805])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][131] ([i915#6095]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#6095]) +21 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][133] -> [INCOMPLETE][134] ([i915#12796])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][135] ([i915#12313])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#6095]) +32 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#14098] / [i915#6095]) +44 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3742])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3742])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-9:        NOTRUN -> [SKIP][140] ([i915#13784])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#13783]) +4 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-9:        NOTRUN -> [SKIP][142] ([i915#11151] / [i915#7828]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#11151] / [i915#7828]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#11151] / [i915#7828]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#11151] / [i915#7828])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#11151] / [i915#7828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#11151] / [i915#7828]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#11151] / [i915#7828]) +4 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3299])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#3116])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3116] / [i915#3299])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][152] ([i915#3299])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#6944] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [FAIL][154] ([i915#7173]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7118])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_content_protection@srm.html
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#6944] / [i915#7116] / [i915#7118])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2-9:        NOTRUN -> [SKIP][157] ([i915#7118] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3555]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#3555]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#3555]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#3555] / [i915#8814])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3555]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x128:
    - shard-dg1:          [PASS][163] -> [DMESG-WARN][164] ([i915#4423])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-13/igt@kms_cursor_crc@cursor-random-128x128.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_cursor_crc@cursor-random-128x128.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-tglu:         [PASS][165] -> [FAIL][166] ([i915#13566]) +3 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-9/igt@kms_cursor_crc@cursor-random-128x42.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][167] -> [FAIL][168] ([i915#13566]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3555]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#13049])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][171] +25 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#13049])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#13049])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#13049]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#13049])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][176] ([i915#13566]) +3 other tests fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][177] ([i915#13566]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-9:        NOTRUN -> [SKIP][178] ([i915#3555]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#13049]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-9:        NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#4103])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13046] / [i915#5354]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][183] +55 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#9809]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][185] ([i915#13046] / [i915#5354]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-rkl:          [PASS][186] -> [FAIL][187] ([i915#2346])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2-9:        NOTRUN -> [SKIP][188] ([i915#9067])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#9067])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#4103]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#4103])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#9723])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#13691])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][195] -> [SKIP][196] ([i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#13749])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][198] -> [SKIP][199] ([i915#13707])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][200] ([i915#8812])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3840]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3840])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][208] ([i915#3840] / [i915#9053])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#1839])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-9:        NOTRUN -> [SKIP][211] ([i915#1839]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#658])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][215] -> [FAIL][216] ([i915#11832] / [i915#13734]) +1 other test fail
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#9934])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#3637] / [i915#9934]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9934]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#9934]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-9:        NOTRUN -> [SKIP][221] ([i915#9934]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637] / [i915#9934]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#9934])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][224] -> [FAIL][225] ([i915#13734]) +1 other test fail
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [PASS][226] -> [FAIL][227] ([i915#13734]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          NOTRUN -> [FAIL][228] ([i915#13027]) +1 other test fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#12745] / [i915#4839])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#12745])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-tglu:         [PASS][231] -> [FAIL][232] ([i915#13734]) +7 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_flip@plain-flip-ts-check.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-tglu:         [PASS][233] -> [FAIL][234] ([i915#11832] / [i915#13734])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#2672] / [i915#3555])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#2587] / [i915#2672]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#2672]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#2672]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#5190])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][244] ([i915#2672])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#2587] / [i915#2672] / [i915#3555])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#8708]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          [PASS][250] -> [SKIP][251] +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][252] ([i915#5354]) +14 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#1825]) +7 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][254] +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][255] ([i915#8708]) +12 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#8708]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][257] -> [INCOMPLETE][258] ([i915#10056])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][259] ([i915#10056] / [i915#13353])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [PASS][260] -> [FAIL][261] ([i915#6880])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#1825]) +52 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#5354]) +22 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][264] ([i915#3458]) +8 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][265] ([i915#10055]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#3458]) +13 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#3458]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#3023]) +24 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#8708]) +9 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] +33 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8228]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#12713])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-9:        NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#10656])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12388])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#12388])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#10656])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#13688])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#12339])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12339])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [PASS][283] -> [SKIP][284] ([i915#12388])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#13522])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#4816])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#4070] / [i915#4816])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-9:        NOTRUN -> [SKIP][288] ([i915#6301])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#6301])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-mtlp:         NOTRUN -> [SKIP][290]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#13705])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][292] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8821])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#13958]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#14259])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#14259])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2-9:        NOTRUN -> [SKIP][297] ([i915#13046] / [i915#5354] / [i915#9423])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][298] ([i915#6953] / [i915#9423])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#6953])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-9:        NOTRUN -> [SKIP][300] ([i915#12247] / [i915#9423]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-9:        NOTRUN -> [SKIP][301] ([i915#12247]) +7 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#9423])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12247]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#12247]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#12247] / [i915#6953])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#12247]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#5354])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#9812])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#9685])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#9685]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3828])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#14104])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][313] ([i915#9295])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#3361])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2-9:        NOTRUN -> [SKIP][315] ([i915#9519])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#9519])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#9519])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          [PASS][319] -> [SKIP][320] ([i915#9519]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#9519])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#9519])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9519]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          [PASS][324] -> [DMESG-WARN][325] ([i915#12964]) +17 other tests dmesg-warn
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][326] ([i915#11520]) +7 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#11520]) +7 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#11520]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][329] ([i915#11520]) +8 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#11520]) +10 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][331] ([i915#11520])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +3 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#11520]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#9808])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#12316]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#9683])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#1072] / [i915#9732]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#9688]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9732]) +16 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +20 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][342] ([i915#1072] / [i915#9732]) +13 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +20 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#9732]) +6 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#9685])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#12755])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#5289])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][348] ([i915#12755] / [i915#5190])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#5289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][350] ([i915#12755])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][351] ([i915#13179]) +1 other test abort
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][352] -> [FAIL][353] ([i915#5465]) +1 other test fail
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-4/igt@kms_setmode@basic.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#3555] / [i915#8809])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][355] ([i915#12964]) +17 other tests dmesg-warn
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_vblank@query-idle@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9906])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#9906])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#3555] / [i915#9906])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#3555] / [i915#9906])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2-9:        NOTRUN -> [SKIP][360] ([i915#9906])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#2437] / [i915#9412])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][362] ([i915#2437]) +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#2437])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#2437] / [i915#9412]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#7387])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@perf@global-sseu-config.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#7387]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-dg2-9:        NOTRUN -> [SKIP][367] ([i915#2434])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][368] ([i915#4349]) +4 other tests fail
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-mtlp:         [PASS][369] -> [FAIL][370] ([i915#4349]) +2 other tests fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2-9:        NOTRUN -> [FAIL][371] ([i915#12549] / [i915#6806]) +1 other test fail
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][372] ([i915#14433])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk2/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#8516])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][374] ([i915#3708] / [i915#4077])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2-9:        NOTRUN -> [SKIP][375] ([i915#3291] / [i915#3708]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#3708] / [i915#4077])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][377] ([i915#3708]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#3708]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#9917])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#9917]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-mtlp:         NOTRUN -> [FAIL][381] ([i915#12910])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2-9:        NOTRUN -> [SKIP][382] ([i915#9917])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][383] ([i915#13356]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@gem_ccs@suspend-resume.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][385] ([i915#12392]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][387] ([i915#13363]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-10/igt@gem_eio@kms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@gem_eio@kms.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          [TIMEOUT][389] ([i915#12964]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          [TIMEOUT][391] ([i915#12917] / [i915#12964]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [ABORT][393] ([i915#13723]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@i915_hangman@detector@vcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][395] ([i915#12797]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][397] ([i915#13550]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@i915_selftest@live.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@i915_selftest@live.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [ABORT][399] ([i915#11703]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [FAIL][401] ([i915#5956]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-dg1:          [DMESG-WARN][403] ([i915#4423]) -> [PASS][404] +3 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@kms_cursor_crc@cursor-random-128x42.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu:         [FAIL][405] ([i915#13566]) -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [FAIL][407] ([i915#14001] / [i915#2346]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][409] ([i915#9878]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][411] ([i915#11832] / [i915#13734]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][413] ([i915#14033] / [i915#14350]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][415] ([i915#14033]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][417] ([i915#13734]) -> [PASS][418] +4 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         [FAIL][419] ([i915#13734]) -> [PASS][420] +2 other tests pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-snb:          [FAIL][421] ([i915#13734]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:
    - shard-rkl:          [FAIL][423] ([i915#13734]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [SKIP][425] -> [PASS][426] +4 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [DMESG-WARN][427] ([i915#12964]) -> [PASS][428] +18 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][429] ([i915#3555] / [i915#8228]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-8/igt@kms_hdr@static-swap.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][431] ([i915#9340]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][433] ([i915#9519]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-dg2:          [FAIL][435] ([i915#5465]) -> [PASS][436] +2 other tests pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][437] ([i915#5465]) -> [PASS][438] +2 other tests pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-tglu:         [FAIL][439] ([i915#10538]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][441] ([i915#11943]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          [FAIL][443] ([i915#11943]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][445] ([i915#11943]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [TIMEOUT][447] ([i915#12917] / [i915#12964]) -> [SKIP][448] ([i915#13717])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][449] ([i915#6095]) -> [SKIP][450] ([i915#14098] / [i915#6095]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          [SKIP][451] ([i915#12805] / [i915#4423]) -> [SKIP][452] ([i915#12805])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][453] ([i915#14098] / [i915#6095]) -> [SKIP][454] ([i915#6095]) +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [FAIL][455] ([i915#7173]) -> [SKIP][456] ([i915#7118] / [i915#9424]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][457] ([i915#9433]) -> [SKIP][458] ([i915#9424])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-12/igt@kms_content_protection@mei-interface.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-snb:          [INCOMPLETE][459] ([i915#8816]) -> [SKIP][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_content_protection@type1.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_content_protection@type1.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg1:          [SKIP][461] ([i915#4423] / [i915#9934]) -> [SKIP][462] ([i915#9934])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-rkl:          [DMESG-WARN][463] ([i915#12964]) -> [FAIL][464] ([i915#13734])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-rkl:          [DMESG-WARN][465] ([i915#12964]) -> [FAIL][466] ([i915#11832] / [i915#13734]) +1 other test fail
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-dg1:          [SKIP][467] ([i915#4423]) -> [SKIP][468]
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          [SKIP][469] ([i915#3458] / [i915#4423]) -> [SKIP][470] ([i915#3458])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [SKIP][471] ([i915#3458]) -> [SKIP][472] ([i915#10433] / [i915#3458]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][473] ([i915#4423] / [i915#8708]) -> [SKIP][474] ([i915#8708])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][475] ([i915#10433] / [i915#3458]) -> [SKIP][476] ([i915#3458]) +3 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          [SKIP][477] ([i915#12713]) -> [SKIP][478] ([i915#1187] / [i915#12713])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [FAIL][479] ([i915#9295]) -> [SKIP][480] ([i915#3361])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          [FAIL][481] ([i915#14353]) -> [FAIL][482] ([i915#5465])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
  [i915#11832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13353
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
  [i915#13734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14001]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14001
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14353
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8404 -> IGTPW_13272
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_16685: aafbd01c99cde1b0b8a117e0ae1b77e87554c7b6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13272: e7fde96cf281775701d23c2ff70b06a47d25f9ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/index.html

--===============6460603828506416122==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Fix skip condition to account for padded BO size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150086/">https://patchwork.freedesktop.org/series/150086/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16685_full -&gt; IGTPW_13272_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13272_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13272_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13272_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr@psr2-cursor-render@edp-1:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-5/igt@kms_psr@psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_psr@psr2-cursor-render@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13272_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@gem_caching@read-writes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-12/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_params@secure-non-master.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_exec_params@secure-non-root.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@gem_mmap_gtt@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@gem_pxp@display-protected-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_pxp@display-protected-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@gen9_exec_parse@bb-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@busy-idle-check-all@ccs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk9/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797">i915#12797</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967">i915#12967</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228">i915#6228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967">i915#12967</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-15/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +398 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +170 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-13/igt@kms_cursor_crc@cursor-random-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_cursor_crc@cursor-random-128x128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-9/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> +25 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> +55 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +12 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13353">i915#13353</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104">i915#14104</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_pm_rpm@pm-caching.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_vblank@query-idle@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-7/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-5/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549">i915#12549</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk2/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@gem_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-10/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-8/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@i915_hangman@detector@vcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723">i915#13723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@i915_hangman@detector@vcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797">i915#12797</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550">i915#13550</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703">i915#11703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@kms_cursor_crc@cursor-random-128x42.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-10/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14001">i915#14001</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-tglu-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-tglu-7/igt@perf@gen12-group-concurrent-oa-buffer-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-16/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb7/igt@kms_content_protection@type1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816">i915#8816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb5/igt@kms_content_protection@type1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-18/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-4/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734">i915#13734</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16685/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14353">i915#14353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13272/shard-snb2/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8404 -&gt; IGTPW_13272</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16685: aafbd01c99cde1b0b8a117e0ae1b77e87554c7b6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13272: e7fde96cf281775701d23c2ff70b06a47d25f9ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6460603828506416122==--
